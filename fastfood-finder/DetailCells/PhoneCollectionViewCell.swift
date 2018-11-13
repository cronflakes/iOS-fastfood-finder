//
//  DetailCellCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/10/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class PhoneCollectionViewCell: UICollectionViewCell {
    
//    var number: String?
//    
//    var place: Place? {
//        didSet {
//            if let phoneNumber = place?.phone {
//                phoneNumberLabel.text = phoneNumber
//            }
//        }
//    }

    let phoneLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "phone")
        return imageView
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone: "
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
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

        
        
        addSubview(phoneLogo)
        phoneLogo.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        phoneLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        phoneLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        phoneLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        addSubview(phoneLabel)
        phoneLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneLogo.trailingAnchor, constant: 15).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        addSubview(phoneNumberLabel)
        phoneNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 5).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
