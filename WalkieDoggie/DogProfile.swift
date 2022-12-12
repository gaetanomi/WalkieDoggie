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
    case both
}


    enum Breed : String, CaseIterable, Identifiable {
    
    var id : String { UUID().uuidString }
    
    case germanShepherd = "German Shepherd"
    case labrador = "Labrador"
    case frenchBulldog = "French Bulldog"
    case goldenRetriever = "Golden Retriever"
    case borderCollie = "Border Collie"
    case corgi = "Corgi"
}


struct DogProfile {
    let id: UUID = UUID()
    var name: String
    var age: Int
    var pictures: [String]
    var description: String
    
    let sex: Sex
    let breed: Breed

    var latitude: Double
    var longitude: Double
    
    var sexPreference: Sex = Sex.both
    var maxDistance: Double = 15_000 //meters?
    var breedPreferences: [String] = ["","",""]
}


var dogExample = DogProfile(name: "Luna", age: 2, pictures: ["dogExample1","dogExample2","dogExample3"], description: "I am very cute and i love running in the grass. my owner loves me so much and i am willing to meet you all. my favourite food is cat food even if i'm a dog", sex: Sex.male, breed: .borderCollie, latitude: 0.0, longitude: 0.0)

var aria = DogProfile(name: "aria", age: 10, pictures: ["",""], description: "sss", sex: Sex.male, breed: Breed.goldenRetriever, latitude: 40.82669, longitude: 14.504204)
