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

class AddPlacePointViewController: UIViewController {
    
    private let addPlacePointView = AddPlacePointView()
    private let api = GoogleMapAPI()
    private let locationManager = CLLocationManager()
    private let searchView = UIView()
    private let resultViewController: GMSAutocompleteResultsViewController
    private let searchController: UISearchController
    
    private var model: AddPlacePointModel
    
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
    
    //MARK: UI
    
    private func setUI() {
        
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
    
    @objc private func popAction(sender: UIButton) {
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
    
    // alert메세지 띄우기
    private func displayAlert(title: String, message: String) {
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "확인", style: .default)
           alertController.addAction(action)
           present(alertController, animated: true)
       }

}

//MARK: mapViewDelegate
extension AddPlacePointViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let name = view.annotation?.title ?? ""
        let address = view.annotation?.subtitle ?? ""
        
        addPlacePointView.selectedAnnotationView.configure(name: name ?? "", address: address ?? "", PlaceList: [1, 2, 3, 4])
        mapView.selectedAnnotations.removeAll()
        
    }
    
}

extension AddPlacePointViewController: GMSAutocompleteResultsViewControllerDelegate {
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
    searchController.isActive = false
    // Do something with the selected place.
    setRegion(place: place)
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



