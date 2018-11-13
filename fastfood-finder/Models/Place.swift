//
//  Place.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/25/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let logo: String?
    let pngLogo: String?
    let address: String?
    let city: String?
    let state: String?
    let phone: String?
    let latitude: String?
    let longitude: String?
    let hours: [[String?]]
    let popularItems: [[String?]]
    let budgetItems: [[String?]]
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, logo: String, pngLogo: String, address: String, city: String, state: String, phone: String, latitude: String, longitude: String, hours: [[String]], popularItems: [[String]], budgetItems: [[String]]) {
        self.title = title
        self.logo = logo
        self.pngLogo = pngLogo
        self.address = address
        self.city = city
        self.state = state
        self.phone = phone
        self.hours = hours
        self.popularItems = popularItems
        self.budgetItems = budgetItems
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
    
    var distance: Double?
}
