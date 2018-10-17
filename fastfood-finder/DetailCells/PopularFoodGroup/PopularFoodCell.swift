//
//  PopularFoodCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/17/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class PopularFoodCell: UICollectionViewCell {
    
    let foodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "chicfilaentree")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let foodLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chicken Sandwich"
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let foodPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$5.99"
        label.font = UIFont(name: "Avenir Next", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDisplayCell()
    }
    

    func setupDisplayCell() {
//        backgroundColor = .cyan
        

        
        addSubview(foodImage)
        foodImage.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(foodLabel)
        foodLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 3).isActive = true
        foodLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        foodLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        foodLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        addSubview(foodPrice)
        foodPrice.topAnchor.constraint(equalTo: foodLabel.bottomAnchor).isActive = true
        foodPrice.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        foodPrice.heightAnchor.constraint(equalToConstant: 20).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
