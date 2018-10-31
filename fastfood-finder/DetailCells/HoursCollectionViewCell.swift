//
//  HoursCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/16/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class HoursCollectionViewCell: UICollectionViewCell {
    
    let hoursLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "clock")
        return imageView
    }()
    
    let hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hours: "
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let hoursDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "open • closes at 12 am"
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellDisplay()
    }
    
    func setupCellDisplay() {
        
        backgroundColor = .white
        
        addSubview(hoursLogo)
        hoursLogo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hoursLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        hoursLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        hoursLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(hoursLabel)
        hoursLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hoursLabel.leadingAnchor.constraint(equalTo: hoursLogo.trailingAnchor, constant: 15).isActive = true
        hoursLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        hoursLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(hoursDescriptionLabel)
        hoursDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hoursDescriptionLabel.leadingAnchor.constraint(equalTo: hoursLabel.trailingAnchor, constant: 5).isActive = true
        hoursDescriptionLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        hoursDescriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
