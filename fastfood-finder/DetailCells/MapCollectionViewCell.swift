//
//  MapCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/10/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    
    let mapLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "geo_fence")
        return imageView
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address: "
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let addressLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellDisplay()
    }
    
    
    
    func setupCellDisplay() {
        
        backgroundColor = .white    
        
        addSubview(mapLogo)
        mapLogo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mapLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        mapLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        mapLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(addressLabel)
        addressLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: mapLogo.trailingAnchor, constant: 15).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(addressLocationLabel)
        addressLocationLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addressLocationLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: 5).isActive = true
        addressLocationLabel.widthAnchor.constraint(equalToConstant: 190).isActive = true
        addressLocationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
