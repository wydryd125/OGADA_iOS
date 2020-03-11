//
//  AddTravelViewController.swift
//  temp
//
//  Created by 정유경 on 2020/03/07.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class AddTravelViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var departureDate: Date?
    private var arrivalDate: Date?
    private var nationSelected: String?
    private var nationText: String?
    private var foreignText: String?
    
    private let OGADA = UILabel()
    private let leftImage = UIImageView()
    private let rightImage = UIImageView()
    private let nationLabel = UILabel()
    private let nationButton = UIButton()
    private let nationArray = ["선택","대만","러시아","멕시코","미국","베트남","브라질","스위스","영국","유럽","인도","일본","중국","캐나다","태국","한국","호주","홍콩","기타"]
    private lazy var nationArrayCount = self.nationArray.count
    private let nationPickerView = UIPickerView()
    private let otherNationTextField = UITextField()
    
    private let departureDateButton = UIButton()
    private let arrivalDateButton = UIButton()
    private let datePickerView = UIDatePicker()
    
    private let memoImage = UIImageView()
    private let subTitleLabel = UILabel()
    private let subTitleTextField = UITextField() // 텍스트뷰로 바꿔보기
    private let moneyLabel = UILabel()
    private let moneySelectButton = UIButton()
    
    private let totalBudgetLabel = UILabel()
    private let totalBudgetTextField = UITextField()
    private let completeButton = UIButton()
    private let labelBoldLine = UILabel()
    private let labelBoldLine2 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate
        setUI()
        setConstrains()
    }
    //MARK: UI
    func setUI() {
        let textSize: CGFloat = 16
         view.backgroundColor = .background
        
        OGADA.text = "OGADA"
        OGADA.textColor = .text
        OGADA.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(OGADA)
        
        labelBoldLine.backgroundColor = .subText
        view.addSubview(labelBoldLine)
        
        nationLabel.backgroundColor = .background
        nationLabel.text = "여행지"
        nationLabel.textAlignment = .left
        nationLabel.textColor = .text
        nationLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        view.addSubview(nationLabel)
        
        nationButton.backgroundColor = .subText
        nationButton.tag = 0
        nationButton.setTitle("선택", for: .normal)
        nationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        nationButton.titleLabel?.textAlignment = .left
        nationButton.layer.cornerRadius = 8
        nationButton.setTitleColor(.background, for: .normal)
        nationButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        view.addSubview(nationButton)
        
        nationPickerView.dataSource = self
        nationPickerView.delegate = self
        
        leftImage.image = UIImage(named: "왼쪽")
        leftImage.contentMode = .scaleAspectFit
        view.addSubview(leftImage)
        
        rightImage.image = UIImage(named: "오른쪽")
        rightImage.contentMode = .scaleAspectFit
        view.addSubview(rightImage)
        
        otherNationTextField.isHidden = true
        otherNationTextField.placeholder = "여행지를 입력해주세요"
        otherNationTextField.backgroundColor = .background
        view.addSubview(otherNationTextField)
        otherNationTextField.delegate = self
        
        departureDateButton.backgroundColor = .subText
        departureDateButton.layer.cornerRadius = 8
        departureDateButton.setTitle("출발날짜", for: .normal)
        departureDateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        departureDateButton.setTitleColor(.background, for: .normal)
        departureDateButton.addTarget(self, action: #selector(dateChanged), for: .touchUpInside)
        view.addSubview(departureDateButton)
        
        arrivalDateButton.backgroundColor = .subText
        arrivalDateButton.layer.cornerRadius = 8
        arrivalDateButton.setTitle("도착날짜", for: .normal)
        arrivalDateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        arrivalDateButton.setTitleColor(.background, for: .normal)
        arrivalDateButton.addTarget(self, action: #selector(dateChanged), for: .touchUpInside)
        view.addSubview(arrivalDateButton)
        
        datePickerView.datePickerMode = .date
        datePickerView.minimumDate = Date()
        
        subTitleLabel.text = "Note"
        subTitleLabel.textAlignment = .left
        subTitleLabel.textColor = .text
        subTitleLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        view.addSubview(subTitleLabel)
        
        memoImage.image = UIImage(named: "메모")
        memoImage.contentMode = .scaleAspectFill
        view.addSubview(memoImage)
      
//        subTitleTextField.placeholder = "여행에 대해 알려주세요!"
        subTitleTextField.textColor = .subText
        subTitleTextField.backgroundColor = .clear
        view.addSubview(subTitleTextField)
        subTitleTextField.delegate = self
        
        moneyLabel.text = "화폐"
        moneyLabel.textAlignment = .left
        moneyLabel.textColor = .text
        moneyLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        view.addSubview(moneyLabel)
        
        moneySelectButton.backgroundColor = .background
        moneySelectButton.tag = 1
        moneySelectButton.setTitle("선택해주세요.", for: .normal)
        moneySelectButton.setTitleColor(.subText, for: .normal)
        moneySelectButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        view.addSubview(moneySelectButton)
        
        totalBudgetLabel.text = "총예산"
        totalBudgetLabel.textAlignment = .left
        totalBudgetLabel.textColor = .text
        totalBudgetLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        view.addSubview(totalBudgetLabel)
        
        totalBudgetTextField.placeholder = "          예산을 입력해주세요!"
        totalBudgetTextField.backgroundColor = .background
        totalBudgetTextField.keyboardType = .numberPad
        view.addSubview(totalBudgetTextField)
        totalBudgetTextField.delegate = self
        
        completeButton.setImage(UIImage(named: "완료버튼"), for: .normal)
        completeButton.contentMode = .scaleAspectFit
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        view.addSubview(completeButton)
        
        labelBoldLine2.backgroundColor = .subText
        view.addSubview(labelBoldLine2)

    }
    func setConstrains() {
        
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        let lineHeight: CGFloat = 2
        
        [OGADA,labelBoldLine,nationLabel,nationButton,otherNationTextField,departureDateButton,arrivalDateButton,subTitleLabel,subTitleTextField,moneyLabel,moneySelectButton, leftImage,rightImage,totalBudgetLabel,totalBudgetTextField,memoImage,labelBoldLine2,completeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        OGADA.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 2).isActive = true
        OGADA.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 2).isActive = true
    
        labelBoldLine.topAnchor.constraint(equalTo: OGADA.bottomAnchor, constant: padding * 4  ).isActive = true
        labelBoldLine.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        labelBoldLine.heightAnchor.constraint(equalToConstant: lineHeight).isActive = true
        labelBoldLine.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        
        nationLabel.topAnchor.constraint(equalTo: labelBoldLine.bottomAnchor, constant: padding * 4).isActive = true
        nationLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        nationLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        nationLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        nationButton.topAnchor.constraint(equalTo: nationLabel.topAnchor).isActive = true
        nationButton.leadingAnchor.constraint(equalTo: nationLabel.trailingAnchor).isActive = true
        nationButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        nationButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        otherNationTextField.topAnchor.constraint(equalTo: nationLabel.topAnchor, constant: 0.5).isActive = true
        otherNationTextField.heightAnchor.constraint(equalToConstant: 38).isActive = true
        otherNationTextField.leadingAnchor.constraint(equalTo: nationButton.trailingAnchor, constant: padding * 2).isActive = true
        otherNationTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
       
        
        departureDateButton.topAnchor.constraint(equalTo: nationButton.bottomAnchor, constant: padding * 4).isActive = true
        departureDateButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 3).isActive = true
        departureDateButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        departureDateButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        leftImage.centerYAnchor.constraint(equalTo: departureDateButton.centerYAnchor).isActive = true
        leftImage.leadingAnchor.constraint(equalTo: departureDateButton.trailingAnchor).isActive = true
        leftImage.trailingAnchor.constraint(equalTo: labelBoldLine.trailingAnchor, constant: -padding * 2).isActive = true
        
        arrivalDateButton.topAnchor.constraint(equalTo: leftImage.bottomAnchor, constant: padding * 4).isActive = true
        arrivalDateButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 3).isActive = true
        arrivalDateButton.heightAnchor.constraint(equalToConstant: 38).isActive = true
        arrivalDateButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        rightImage.centerYAnchor.constraint(equalTo: arrivalDateButton.centerYAnchor).isActive = true
        rightImage.trailingAnchor.constraint(equalTo: arrivalDateButton.leadingAnchor).isActive = true
        rightImage.leadingAnchor.constraint(equalTo: labelBoldLine.leadingAnchor, constant: padding * 2).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: arrivalDateButton.bottomAnchor, constant: padding * 4).isActive = true

        subTitleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        subTitleLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        memoImage.topAnchor.constraint(equalTo: arrivalDateButton.bottomAnchor, constant: padding * 4).isActive = true
        memoImage.leadingAnchor.constraint(equalTo: subTitleLabel.trailingAnchor, constant: padding * 4).isActive = true
        memoImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        
        subTitleTextField.topAnchor.constraint(equalTo: memoImage.topAnchor).isActive = true
        subTitleTextField.leadingAnchor.constraint(equalTo: memoImage.leadingAnchor, constant: padding * 2).isActive = true
        subTitleTextField.trailingAnchor.constraint(equalTo: memoImage.trailingAnchor, constant: -padding * 2).isActive = true

        moneyLabel.topAnchor.constraint(equalTo: memoImage.bottomAnchor, constant: padding * 4).isActive = true
        moneyLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        moneyLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        moneyLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        moneySelectButton.topAnchor.constraint(equalTo: moneyLabel.topAnchor, constant: 0.5).isActive = true
        moneySelectButton.leadingAnchor.constraint(equalTo: moneyLabel.trailingAnchor, constant: padding * 4).isActive = true
        moneySelectButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        
        totalBudgetLabel.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: padding * 4).isActive = true
         totalBudgetLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        totalBudgetLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        totalBudgetLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        totalBudgetTextField.topAnchor.constraint(equalTo: totalBudgetLabel.topAnchor, constant: padding).isActive = true
        totalBudgetTextField.leadingAnchor.constraint(equalTo: totalBudgetLabel.trailingAnchor, constant: padding * 4).isActive = true
        totalBudgetTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        
        completeButton.topAnchor.constraint(equalTo: totalBudgetTextField.bottomAnchor, constant: padding * 8).isActive = true
        completeButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        completeButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.3).isActive = true
        completeButton.heightAnchor.constraint(equalTo: completeButton.widthAnchor).isActive = true
        
        labelBoldLine2.topAnchor.constraint(equalTo: completeButton.bottomAnchor, constant: padding * 4).isActive = true
        labelBoldLine2.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        labelBoldLine2.heightAnchor.constraint(equalToConstant: lineHeight).isActive = true
        labelBoldLine2.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        
    
        
    }
    //MARK: Action
    
      // 국가 피커뷰
    var selectedButton = true
    @objc func showPicker(_ sender: UIButton) {
        
        selectedButton = sender == nationButton
        
        if sender.tag == 0 {
            nationArrayCount = nationArray.count
//            nationButton.backgroundColor = .text
        } else {
            nationArrayCount = nationArray.count - 1
        }
        
        nationPickerView.reloadAllComponents()
        nationPickerView.selectRow(0, inComponent: 0, animated: false)
        
        let alert = UIAlertController(title: "국가 선택", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        let AddTravelVC = AddTravelViewController()
        
        AddTravelVC.view = nationPickerView
        AddTravelVC.preferredContentSize.height = 200
        alert.setValue(AddTravelVC, forKey: "contentViewController")
        self.present(alert, animated: false)
        
    }
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        nationArrayCount
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = nationArray[row]
        return row
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nationSelected = nationArray[row]
        
        let breedNationSelected = nationSelected!
       
        switch selectedButton {
        case true:
            nationButton.setTitle("\(breedNationSelected)", for: .normal)
            nationText = breedNationSelected
            case false:
            moneySelectButton.setTitle("\(breedNationSelected)", for: .normal)
            foreignText = breedNationSelected
        }
        
        if breedNationSelected == "기타" {
            otherNationTextField.isHidden = false
            
        } else {
            nationButton.backgroundColor = .text
            otherNationTextField.isHidden = true
        }
       
    }
    //날짜 피커뷰
    @objc func dateChanged(_ sender: UIButton) {
        
        let alertTitle: String
        
        sender == departureDateButton ? (alertTitle = "출발 날짜 선택") : (alertTitle = "도착 날짜 선택")
        
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let `self` = self else { return }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "yy.MM.dd"
            let dateString = dateFormatter.string(from: self.datePickerView.date)
            
            if sender == self.departureDateButton {
                self.departureDateButton.setTitle(dateString, for: .normal)
                self.departureDate = self.datePickerView.date
            } else {
                self.arrivalDateButton.setTitle(dateString, for: .normal)
                self.arrivalDate = self.datePickerView.date
            }
            
        }
        alert.addAction(okAction)
        
        let AddTravelVC = AddTravelViewController()
        AddTravelVC.view = datePickerView
        AddTravelVC.preferredContentSize.height = 200 // height
        alert.setValue(AddTravelVC, forKey: "contentViewController")
        self.present(alert, animated: false)
        
    }
    // 컴플릿버튼 액션
    var infoArray = [Any]()
    
    @objc func completeButtonDidTap() {
        guard let budgitToString = totalBudgetTextField.text,
            let totalBudget = Int(budgitToString),
            let foreign = foreignText,
            let subTitle = subTitleTextField.text,
            let departuteDate = departureDate,
            let arrivalDate = arrivalDate,
            let nation = nationText else { return print("foreign")}
        
        let travel = TravelInfo(nation: nation, departureDate: departuteDate, arrivalDate: arrivalDate, subTitle: subTitle, foreign: foreign, totalBudget: totalBudget)
//        print(travel)
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateKey = formatter.string(from: date)
        let foreignKey = foreign
        
        let finalKey = dateKey + foreignKey
        
        var travelKey: [String]
        
        if let temp = UserDefaults.standard.object(forKey: UserDefaultKeys.travelKey.rawValue) as? [String] {
            travelKey = temp
//            travelKey.append(finalKey)
        } else {
            travelKey = []
        }

        travelKey.append(finalKey)
        UserDefaults.standard.set(travelKey, forKey: "travelKey")
        
        
        guard let result = try? JSONEncoder().encode(travel) else { return }
        UserDefaults.standard.set(result, forKey: finalKey)
        
        navigationController?.popViewController(animated: true)
    }
    
}
extension AddTravelViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField.text == "" {
                return false
            } else {
                textField.resignFirstResponder()
                return true
            }
        }
    
}
