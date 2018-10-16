//
//  RatingCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/16/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class RatingsCollectionViewCell: UICollectionViewCell {
    
    
    let ratingsLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "approval")
        return imageView
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rating: "
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let ratingsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.5 out of 5.0"
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
  
        
        setupCellDisplay()
    }
    

    func setupCellDisplay() {
        
        backgroundColor = .white
        
        addSubview(ratingsLogo)
        ratingsLogo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ratingsLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        ratingsLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        ratingsLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(ratingsLabel)
        ratingsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ratingsLabel.leadingAnchor.constraint(equalTo: ratingsLogo.trailingAnchor, constant: 15).isActive = true
        ratingsLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ratingsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(ratingsDescriptionLabel)
        ratingsDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ratingsDescriptionLabel.leadingAnchor.constraint(equalTo: ratingsLabel.trailingAnchor, constant: 5).isActive = true
        ratingsDescriptionLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        ratingsDescriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
