//
//  DVCExtensions.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/25/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import Foundation
import UIKit

extension DisplayViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCellID", for: indexPath) as! PlaceTableViewCell
        cell.setCell(place: placesArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        slideOutBar.place = placesArray[indexPath.row]
        slideOutBar.placeTapped()
    }
    
    
}


//rounding location distances to 2 decimal places
extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
