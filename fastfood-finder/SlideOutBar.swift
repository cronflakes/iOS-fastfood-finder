//
//  SlideOutBar.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/6/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

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
        collectionView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.7633508134)
        return collectionView
    }()
    

    
    func placeTapped() {
        if let window = UIApplication.shared.keyWindow {
            backgroundShader.backgroundColor = UIColor(white: 0, alpha: 0.6)
            backgroundShader.frame = window.frame
            backgroundShader.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSlideOutBar)))
            
            window.addSubview(backgroundShader)
            window.addSubview(header)
            window.addSubview(collectionView)
            
            let width: CGFloat = window.frame.width * 0.80
            header.frame = CGRect(x: -width, y: 0, width: width, height: 230)
            collectionView.frame = CGRect(x: -width, y: 230, width: width, height: window.frame.height)
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                self.backgroundShader.alpha = 1
                self.header.frame = CGRect(x: 0, y: 0, width: width, height: 230)
                self.collectionView.frame = CGRect(x: 0, y: 230, width: width, height: self.collectionView.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func hideSlideOutBar() {
        print("hideSlideOutBar called!")
        UIView.animate(withDuration: 0.4) {
            self.backgroundShader.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.header.frame = CGRect(x: -window.frame.width, y: 0, width: self.header.frame.width, height: self.header.frame.height)
                self.collectionView.frame = CGRect(x: -window.frame.width, y: self.header.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
    
    
}
