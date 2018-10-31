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
    
    var distanceInMeters: Double?
    var distanceInMiles: Double?
    
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
            self.mapView.register(PlacesAnnotationMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            self.mapView.addAnnotations(self.placesArray)
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
    
    func locationInverter(location: CLLocation) -> CLLocationCoordinate2D {
        let invertedLocation: CLLocationCoordinate2D = location.coordinate
        return invertedLocation
    }
    
    
    func getData() {
        dispatchGroup.enter()
        let url = "http://localhost:3000/locations/63123"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!) { (data, response, error) in
            do {
                let places = try JSONDecoder().decode([RootClass].self, from: data!)
                for place in places {
                    self.placesArray.append(Place(title: place.name, logo: place.logo, pngLogo: place.pngLogo, address: place.address, city: place.city, state: place.state, phone: place.phone, latitude: place.latitude, longitude: place.longitude, hours: place.hours, popularItems: place.popularItems, budgetItems: place.budgetItems))
                    self.sortByDistance()
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
    
    func calcDistance(to: CLLocation) -> Double {
        if let location = initialLocation {
            let fromLocation = locationConverter(location: location)
            
            let toLocation = locationConverter(location: to.coordinate)
            
            distanceInMeters = fromLocation.distance(from: toLocation)
            distanceInMiles = distanceInMeters! / 1609.344
            
            return distanceInMiles!.roundTo(places: 2)
        } else {
            return 5.0
        }

    }
    
    func sortByDistance() {
        for i in 0..<placesArray.count {
            placesArray[i].distance = calcDistance(to: locationConverter(location: placesArray[i].coordinate))
        }
    }
    
    
}



