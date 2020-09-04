//
//  CityDetailViewController.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit
import MapKit

class CityDetailViewController: UIViewController, CityDetailViewProtocol {
    
    @IBOutlet private var cityNameLabel: UILabel!
    @IBOutlet private var coordinatesLabel: UILabel!
    @IBOutlet private var mapView: MKMapView!
    
    @IBAction private func rateBtnTapped(_ sender: UIButton) {
        onRateBtnTapped?(presenter.getCityName())
    }
    
    var presenter: CityDetailPresenterProtocol!
    
    var onRateBtnTapped: ItemClosure<String>?
    
    weak var controller: UIViewController! { self }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
    }
    
}

// MARK: - Private
private extension CityDetailViewController {
    
    func configureElements() {
        cityNameLabel.text = presenter.getCityName()
        coordinatesLabel.text = presenter.getStringCoordinates()
        
        if let coordinates = presenter.getCoordinates() {
            setupMapView(with: coordinates)
        }
        
    }
    
    func setupMapView(with coordinates: CLLocationCoordinate2D) {
        let center = CLLocationCoordinate2DMake(coordinates.latitude, coordinates.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        
        mapView.setRegion(region, animated: true)
        mapView.isHidden = false
        
        mapView.addAnnotation(annotation)
    }
    
}
