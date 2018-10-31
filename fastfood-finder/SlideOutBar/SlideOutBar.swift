//
//  SlideOutBar.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/6/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit
import MapKit


class SlideOutBar: NSObject {
    
    let backgroundShader = UIView()
    
    let header: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.6889982877)
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.736515411)
        return collectionView
    }()
    
    let bottomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next", size: 18)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next", size: 12)
        return label
    }()
    
    
    var place: Place? {
        didSet {
            if let pngLogo = place?.pngLogo {
                logo.image = getURLImage(image: pngLogo)
            }
            
            if let name = place?.title {
                nameLabel.text = name
            }
            
            if let address = place?.address {
                addressLabel.text = address
            }
        }
    }
    
    
    override init() {
        super.init()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        collectionView.register(PhoneCollectionViewCell.self, forCellWithReuseIdentifier: "PhoneCellID")
        collectionView.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: "MapCellID")
        collectionView.register(HoursCollectionViewCell.self, forCellWithReuseIdentifier: "HoursCellID")
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCellID")
        collectionView.register(LowestPriceCollectionViewCell.self, forCellWithReuseIdentifier: "LowestPriceCellID")
        
        header.addSubview(logo)
        logo.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        logo.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 90).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        header.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        header.addSubview(addressLabel)
        addressLabel.centerXAnchor.constraint(equalTo: header.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -8).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func openPhoneApp() {
        if let url = URL(string: "tel://\(3148522678)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print("making call son")
        }
    }
    
    func openMapApp(lat: CLLocationDegrees, long: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let regionSpan = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Burger King"
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    func placeTapped() {
        if let window = UIApplication.shared.keyWindow {
            backgroundShader.backgroundColor = UIColor(white: 0, alpha: 0.6)
            backgroundShader.frame = window.frame
            backgroundShader.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSlideOutBar)))
            
            window.addSubview(backgroundShader)
            window.addSubview(header)
            window.addSubview(collectionView)
            
            let width: CGFloat = window.frame.width * 0.80
            header.frame = CGRect(x: -width, y: 0, width: width, height: 260)
            collectionView.frame = CGRect(x: -width, y: 260, width: width, height: window.frame.height)
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                self.backgroundShader.alpha = 1
                self.header.frame = CGRect(x: 0, y: 0, width: width, height: 260)
                self.collectionView.frame = CGRect(x: 0, y: 260, width: width, height: self.collectionView.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func hideSlideOutBar() {
        UIView.animate(withDuration: 0.4) {
            self.backgroundShader.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.header.frame = CGRect(x: -window.frame.width, y: 0, width: self.header.frame.width, height: self.header.frame.height)
                self.collectionView.frame = CGRect(x: -window.frame.width, y: self.header.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
    
    
    func getURLImage(image: String) -> UIImage {
        var urlImage: UIImage?
        let logo = image
        if let url = NSURL(string: logo) {
            if let data = NSData(contentsOf: url as URL) {
                urlImage = UIImage(data: data as Data) //if the image is a broken link from mongoDB this will come up nil
            }
        }

        return urlImage!
    }
    
}




