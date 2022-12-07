//
//  DogProfile.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 07/12/22.
//

import Foundation
import CoreLocation


enum Sex {
    case female
    case male
}


struct DogProfile {
    let id: UUID = UUID()
    var name: String
    var age: Int
    var pictures: [String]
    var description: String
    
    let sex: Sex
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
//
//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//            CLLocationCoordinate2D(
//                latitude: coordinates.latitude,
//                longitude: coordinates.longitude)
//        }
//
}

var dogExample = DogProfile(name: "Luna", age: 2, pictures: ["dogExample1","dogExample2","dogExample3"], description: "I am very cute and i love running in the grass. my owner loves me so much and i am willing to meet you all. my favourite food is cat food even if i'm a dog", sex: Sex.male)
