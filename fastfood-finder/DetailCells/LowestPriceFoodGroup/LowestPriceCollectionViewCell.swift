//
//  LowestPriceCollectionViewCell.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/17/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class LowestPriceCollectionViewCell: UICollectionViewCell {
    
    var lowestPricePlaceCopy: Place?
    
    let sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lowest Priced Items"
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.backgroundColor = .white
        return label
    }()
    
    let lowestPriceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lowestPriceCollectionView.delegate = self
        lowestPriceCollectionView.dataSource = self
        lowestPriceCollectionView.register(LowestPriceFoodCell.self, forCellWithReuseIdentifier: "LowestPriceFoodCellID")
        
        setupDisplayCell()
    }
    

    
    
    func setupDisplayCell() {
    
        backgroundColor = .white
        
        addSubview(sectionTitle)
        sectionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        sectionTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sectionTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(lowestPriceCollectionView)
        lowestPriceCollectionView.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor).isActive = true
        lowestPriceCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowestPriceCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowestPriceCollectionView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension LowestPriceCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.row) {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath) as! LowestPriceFoodCell
            cell.setupItemsInformation(image: (lowestPricePlaceCopy?.budgetItems[indexPath.row][1])!, name: (lowestPricePlaceCopy?.budgetItems[indexPath.row][0])!, price: (lowestPricePlaceCopy?.budgetItems[indexPath.row][2])!)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath) as! LowestPriceFoodCell
            cell.setupItemsInformation(image: (lowestPricePlaceCopy?.budgetItems[indexPath.row][1])!, name: (lowestPricePlaceCopy?.budgetItems[indexPath.row][0])!, price: (lowestPricePlaceCopy?.budgetItems[indexPath.row][2])!)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath) as! LowestPriceFoodCell
            cell.setupItemsInformation(image: (lowestPricePlaceCopy?.budgetItems[indexPath.row][1])!, name: (lowestPricePlaceCopy?.budgetItems[indexPath.row][0])!, price: (lowestPricePlaceCopy?.budgetItems[indexPath.row][2])!)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath) as! LowestPriceFoodCell
            cell.setupItemsInformation(image: (lowestPricePlaceCopy?.budgetItems[indexPath.row][1])!, name: (lowestPricePlaceCopy?.budgetItems[indexPath.row][0])!, price: (lowestPricePlaceCopy?.budgetItems[indexPath.row][2])!)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath) as! LowestPriceFoodCell
            cell.setupItemsInformation(image: (lowestPricePlaceCopy?.budgetItems[indexPath.row][1])!, name: (lowestPricePlaceCopy?.budgetItems[indexPath.row][0])!, price: (lowestPricePlaceCopy?.budgetItems[indexPath.row][2])!)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowestPriceFoodCellID", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    
}
