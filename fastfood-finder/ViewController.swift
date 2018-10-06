//
//  ViewController.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/5/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func findFoodButtonTapped(_ sender: UIButton) {
        getPlaces()
    }
    
    func getPlaces() {
        let url = "http://localhost:3000/locations"
        guard let urlObject = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
            do {
                guard let data = data else { return }
                let places = try JSONDecoder().decode([RootClass].self, from: data)
                print(places)
            } catch {
                print("Error occured fetching JSON")
            }
        }.resume()
    }
    
    
}

