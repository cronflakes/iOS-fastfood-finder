//
//  SOBExtensions.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/25/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension SlideOutBar: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch(indexPath.row) {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCellID", for: indexPath) as! PhoneCollectionViewCell
            cell.phoneNumberLabel.text = place?.phone
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCellID", for: indexPath) as! MapCollectionViewCell
            cell.addressLocationLabel.text = place?.address
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HoursCellID", for: indexPath) as! HoursCollectionViewCell
            cell.getTime(closingTime: Int((place?.hours[dayOfTheWeek!][1])!)!, openingTime: Int((place?.hours[dayOfTheWeek!][0])!)!)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCellID", for: indexPath) as! PopularCollectionViewCell
            cell.popularPlaceCopy = place
            cell.popularFoodCollectionView.reloadData()
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceCellID", for: indexPath) as! LowestPriceCollectionViewCell
            cell.lowestPricePlaceCopy = place
            cell.lowestPriceCollectionView.reloadData()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhoneCellID", for: indexPath)
            return cell
        }

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch(indexPath.row) {
        case 3:
            return CGSize(width: collectionView.frame.width, height: 205) // was 205
        case 4:
            return CGSize(width: collectionView.frame.width, height: 205) //was 205
        default:
            return CGSize(width: collectionView.frame.width, height: 50)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(indexPath.row) {
        case 0:
            openPhoneApp()
        case 1:
            openMapApp(lat: CLLocationDegrees((place?.coordinate.latitude)!), long: CLLocationDegrees((place?.coordinate.longitude)!))
        default:
            openPhoneApp()
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }
    

    
}
