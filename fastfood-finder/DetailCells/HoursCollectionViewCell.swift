//
//  HoursCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/16/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class HoursCollectionViewCell: UICollectionViewCell {
    
    let now = Date()
    var components = DateComponents()
    
    func getTime(closingTime: Int, openingTime: Int) {
        let calendar = Calendar(identifier: .gregorian)
        
        components.year = calendar.component(.year, from: now)
        components.month = calendar.component(.month, from: now)
        components.day = calendar.component(.day, from: now)
        components.hour = closingTime
        components.minute = 0
        components.second = 0
        components.weekday = calendar.component(.weekday, from: now)
        
        let startingTime = Calendar.current.date(from: components)
        
        
        let interval = now.timeIntervalSince(startingTime!)
        
        let timeLeftOpen = closingTime - Int(interval)
        
        
        if(closingTime == -1) {
            openOrClosedLabel.textColor = #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)
            openOrClosedLabel.text = "open"
            hoursDescriptionLabel.text = "• open 24 hours"
        } else if(Double(timeLeftOpen) <= 0.9999999) {
            openOrClosedLabel.textColor = .red
            openOrClosedLabel.text = "closed"
            hoursDescriptionLabel.text = "• will reopen at \(openingTime)am"
        } else if(timeLeftOpen <= 60) {
            openOrClosedLabel.textColor = .yellow
            openOrClosedLabel.text = "closing soon"
            hoursDescriptionLabel.text = "• closes in 1 minute"
        } else if(timeLeftOpen < 3600) {
            openOrClosedLabel.textColor = .yellow
            openOrClosedLabel.text = "closing soon"
            hoursDescriptionLabel.text = "• closes in \(timeLeftOpen / 60) minutes"
        } else {
            let meridiem: String?
            
            if(closingTime >= 86400) {
                meridiem = "am"
            } else {
                meridiem = "pm"
            }
            openOrClosedLabel.textColor = #colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)
            openOrClosedLabel.text = "open"
            
            if(closingTime / 60 / 60 % 12 == 0) {
                hoursDescriptionLabel.text = "• closes at 12\(meridiem!)"
            } else {
                //decipher between closing at :30 or at the hour
                if(closingTime % 3600 != 0) {
                    hoursDescriptionLabel.text = "• closes at \(((closingTime / 60) / 60) % 12):30\(meridiem!)"
                } else {
                    hoursDescriptionLabel.text = "• closes at \(((closingTime / 60) / 60) % 12)\(meridiem!)"
                }
                
                
            }
            
        }

        
    }
    
    
    
    
    
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
    
    let openOrClosedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Next", size: 18)
        return label
    }()
    
    let hoursDescriptionLabel: UILabel = {
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
        
        addSubview(openOrClosedLabel)
        openOrClosedLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        openOrClosedLabel.leadingAnchor.constraint(equalTo: hoursLabel.trailingAnchor, constant: -5).isActive = true

        openOrClosedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(hoursDescriptionLabel)
        hoursDescriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hoursDescriptionLabel.leadingAnchor.constraint(equalTo: openOrClosedLabel.trailingAnchor, constant: 5).isActive = true
        hoursDescriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
