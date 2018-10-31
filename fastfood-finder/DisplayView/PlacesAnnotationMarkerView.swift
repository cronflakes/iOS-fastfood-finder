//
//  PlacesAnnotationMarkerView.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/30/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit
import MapKit

class PlacesAnnotationMarkerView: MKMarkerAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let place = newValue as? Place else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            markerTintColor = .red
        }
    }

}
