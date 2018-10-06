//
//  DisplayViewController.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/5/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit
import MapKit


class DisplayViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    let slideOutBar = SlideOutBar()
    
    private var locationManager = CLLocationManager()
    private var initialLocation: CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locationManager.location?.coordinate {
            initialLocation = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let region = MKCoordinateRegion(center: locationConverter(location: initialLocation!).coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            self.mapView.setRegion(region, animated: true)
        } else { print("Unable to find location") }
    }
   
    
    func locationConverter(location: CLLocationCoordinate2D) -> CLLocation  {
        let lat: CLLocationDegrees = location.latitude
        let long: CLLocationDegrees = location.longitude
        
        let convertedLocation = CLLocation(latitude: lat, longitude: long)
        
        return convertedLocation
    }
  

    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        locationManager.stopUpdatingLocation()
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension DisplayViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        slideOutBar.placeTapped()
    }
    
    
}
