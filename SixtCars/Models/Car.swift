//
//  Car.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

struct CarModel: Codable {

     let id:String!
     let modelIdentifier:String!
     let modelName:String!
     let name:String!
     let make:String!
     let group:String!
     let color:String!
     let series:String!
     let fuelType:String!
     let fuelLevel:Float!
     let transmission:String!
     let licensePlate:String!
     let latitude:Double!
     let longitude:Double!
     let innerCleanliness:String!
     let carImageUrl:String?

}
