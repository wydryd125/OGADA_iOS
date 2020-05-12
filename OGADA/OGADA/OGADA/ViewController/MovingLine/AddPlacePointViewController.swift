//
//  AddPlacePointViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

protocol AddPlacePointViewControllerDelegate: class {
    func completeAddPlaces(position: Int, placeList: [Place])
}

class AddPlacePointViewController: UIViewController {
    
    private let addPlacePointView = AddPlacePointView()
    private let locationManager = CLLocationManager()
    
    private let searchView = UIView()
    private let resultViewController: GMSAutocompleteResultsViewController
    private let searchController: UISearchController
    
    private var model: AddPlacePointModel
    
    weak var delegate: AddPlacePointViewControllerDelegate?
    
    init(position: Int, placeList: [Place]) {
        let resultViewController = GMSAutocompleteResultsViewController()
        self.resultViewController = resultViewController
        self.searchController = UISearchController(searchResultsController: resultViewController)
        
        self.model = AddPlacePointModel(position: position, placeList: placeList)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
        
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
////        print(model.placeList)
//        delegate?.completeAddPlaces(position: model.position, placeList: model.placeList)
//
//    }
    
    
    
    //MARK: UI
    
    private func setUI() {
        
        let completeButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(popAction(sender:)))
        navigationItem.leftBarButtonItem = completeButton
        navigationController?.navigationBar.tintColor = .text
        
        let searchBar = searchController.searchBar
        
        [addPlacePointView, searchView].forEach({
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        searchView.addSubview(searchBar)
        
        searchBar.sizeToFit()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 5
        searchView.layer.shadowOpacity = 0.7
        searchView.layer.shadowRadius = 5
        searchView.layer.shadowOffset = .init(width: 5, height: 0)
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = resultViewController
        resultViewController.delegate = self
        definesPresentationContext = true
        addPlacePointView.backButton.addTarget(
            self,
            action: #selector(popAction(sender:)),
            for: .touchUpInside)
        
        addPlacePointView.mapView.delegate = self
        addPlacePointView.selectedAnnotationView.picker.delegate = self
        addPlacePointView.selectedAnnotationView.picker.dataSource = self
        
        addPlacePointView.selectedAnnotationView.addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        addPlacePointView.selectedAnnotationView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    private func setConstraint() {
        
        addPlacePointView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addPlacePointView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addPlacePointView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addPlacePointView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let insets = view.safeAreaInsets
        let searchViewWidth: CGFloat = view.frame.width - insets.left - insets.right
        let searchViewHeight: CGFloat = searchController.searchBar.bounds.height
        searchView.frame = CGRect(x: 0, y: insets.top, width: searchViewWidth, height: searchViewHeight)
//        print(searchViewHeight)
    }
    
    //MARK: Action
    
    @objc private func popAction(sender: UIBarButtonItem) {
        delegate?.completeAddPlaces(position: model.position, placeList: model.placeList)
        navigationController?.popViewController(animated: true)
        
    }
    
    // 검색 완료시 맵뷰 검색장소로 이동
    private func setRegion(place: GMSPlace) {
        let scope: Double = 0.005
        
        let spen = MKCoordinateSpan(latitudeDelta: scope, longitudeDelta: scope)
        let region = MKCoordinateRegion(center: place.coordinate, span: spen)
        
        addPlacePointView.mapView.setRegion(region, animated: true)
        addAnnotation(place: place)
        
    }
    
    // 맵뷰에 어노테이션 찍기
    private func addAnnotation(place: GMSPlace) {
        let annotation = MKPointAnnotation()
        annotation.title = place.name ?? ""
        annotation.subtitle = place.formattedAddress
        annotation.coordinate = place.coordinate
        
        addPlacePointView.removeAnnotations()
        addPlacePointView.mapView.addAnnotation(annotation)
    }
    
    // 장소 추가 버튼 클릭
    @objc private func didTapAddButton() {
//        print(#function)
        let mapView = addPlacePointView.mapView
        guard let place = model.currentPlace
            else { return }
        
        let index = model.selectedNumberOfPicker ?? 0
        model.placeList.insert(place, at: index)
        addPlacePointView.selectedAnnotationView.hiddenView()
        mapView.removeAnnotations(mapView.annotations)
        displayAlert(title: "동선 추가", message: "\(place.name)")
//        print(model.placeList)
    }
    
    // 장소 추가 취소 버튼 클릭
    @objc private func didTapCancelButton() {
        let mapView = addPlacePointView.mapView
        let selectedAnnotationView = addPlacePointView.selectedAnnotationView
        
        selectedAnnotationView.hiddenView()
        mapView.selectedAnnotations.removeAll()
    }
    
    // alert메세지 띄우기
    private func displayAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "확인", style: .default)
           alertController.addAction(action)
           present(alertController, animated: true)
       }

}

// MARK: extension
extension AddPlacePointViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let place = model.currentPlace else { return }
        addPlacePointView.selectedAnnotationView.configure(selectedPlace: place)
        model.selectedNumberOfPicker = 0
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        model.selectedNumberOfPicker = nil
    }
    
}

extension AddPlacePointViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        model.placeList.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "맨앞": model.placeList[row - 1].name
    }
}

extension AddPlacePointViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        model.selectedNumberOfPicker = row
    }
}


extension AddPlacePointViewController: GMSAutocompleteResultsViewControllerDelegate {
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
    searchController.isActive = false
    // Do something with the selected place.
    setRegion(place: place)
    let coordinate = place.coordinate
    let name = place.name ?? ""
    let address = place.formattedAddress ?? ""
    
    let newPlace = Place(
        latitude: coordinate.latitude,
        longitude: coordinate.longitude,
        name: name ,
        address: address,
        id: place.placeID)
    
    model.currentPlace = newPlace
  }

  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didFailAutocompleteWithError error: Error){
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
//    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
//    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}



