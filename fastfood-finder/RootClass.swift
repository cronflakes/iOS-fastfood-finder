//
//  RootClass.swift
//  fastfood-finder
//
//  Created by Matthew Cassell on 10/5/18.
//  Copyright © 2018 Matthew Cassell. All rights reserved.
//

import Foundation

public struct RootClass: Decodable {
    public var name: String!
    public var address: String?
    public var phone: String?
    public var hours: [Hours]?
    public var image: String?
    public var logo: String?
    public var latitude: String!
    public var longitude: String!
    
}

public struct Hours: Decodable {
    public var monday: String?
    public var tuesday: String?
    public var wednesday: String?
    public var thursday: String?
    public var friday: String?
    public var saturday: String?
    public var sunday: String?
}
