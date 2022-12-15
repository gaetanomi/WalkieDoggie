//
//  Services.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 13/12/22.
//

import Foundation
import CoreLocation

class LocationService {
    func distanceCalculation (otherDogLocation: CLLocation) -> (String, Int) {
        
        let myLocation = CLLocation(latitude: 40.851728, longitude: 14.259420)
        let distance: CLLocationDistance = myLocation.distance(from: otherDogLocation)/1000
        
        let rounded = Int(round(distance))
        return (rounded == 1 ? String(rounded)+"km away" : String(rounded)+"kms away", rounded)
        
    }
}
//
//func filterProfilesByDistance (dogProfiles: [DogProfile], maxDistance: Int, distance: [Int]) -> [DogProfile] {
//    for iter in dogProfiles {
//        if distance[iter] > maxDistance {
//            dogProfiles.remove(at: dogProfiles.firstIndex(of: number))
//        }
//    }
//}



class SettingsVM: ObservableObject {
    
    @Published var distance = 10.0
    
    
}
