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
    
    let dispatchGroup = DispatchGroup()
    let slideOutBar = SlideOutBar()
    
    private var locationManager = CLLocationManager()
    private var initialLocation: CLLocationCoordinate2D?
    
    var placesArray: [Place] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getData()
        
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
        
        

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
    
    
    func getData() {
        dispatchGroup.enter()
        let url = "http://localhost:3000/locations/63123"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!) { (data, response, error) in
            do {
                let places = try JSONDecoder().decode([RootClass].self, from: data!)
                for place in places {
                    self.placesArray.append(Place(name: place.name, logo: place.logo, pngLogo: place.pngLogo, address: place.address, city: place.city, state: place.state, phone: place.phone, latitude: place.latitude, longitude: place.longitude, hours: place.hours, popularItems: place.popularItems, budgetItems: place.budgetItems))
                }
            } catch {
                print("Error occured while parsing JSON")
            }
            self.dispatchGroup.leave()
        }.resume()
    }
  

    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        locationManager.stopUpdatingLocation()
        dismiss(animated: true, completion: nil)
    }
    
    
}



