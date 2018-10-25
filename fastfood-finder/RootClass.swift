//
//  RootClass.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/5/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import Foundation

//MARK: - RootClass
public struct RootClass: Decodable {
    
    public var id : String!
    public var address : String!
    public var budgetItems : [[String]]!
    public var city : String!
    public var hours : [String]!
    public var latitude : String!
    public var logo : String!
    public var longitude : String!
    public var name : String!
    public var phone : String!
    public var pngLogo : String!
    public var popularItems : [[String]]!
    public var state : String!
    public var zip : String!
    
}
