//
//  PlaceTableViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/25/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {


    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    
    func setCell(place: Place) {
        let logo = getURLImage(image: place.logo!)
        logoImageView.image = logo
        nameLabel.text = place.title
        distanceLabel.text = "\(place.distance!) miles away"
    }
    
    
    
    
    
    
    func getURLImage(image: String) -> UIImage {
        var urlImage: UIImage?
        let logo = image
        if let url = NSURL(string: logo) {
            if let data = NSData(contentsOf: url as URL) {
                urlImage = UIImage(data: data as Data)
            }
        }
        
        if urlImage != nil {
            return urlImage!
        } else {
            let imageNotFound = #imageLiteral(resourceName: "notFound")
            return imageNotFound
        }
    }
}
