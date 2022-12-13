//
//  Services.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 13/12/22.
//

import Foundation
import CoreLocation

class LocationService {
    func distanceCalculation (otherDogLocation: CLLocation) -> String {
        
        let myLocation = CLLocation(latitude: 40.851728, longitude: 14.259420)
        let distance: CLLocationDistance = myLocation.distance(from: otherDogLocation)/1000
        
        let rounded = Int(round(distance))
        return (rounded == 1 ? String(rounded)+"km away" : String(rounded)+"kms away")
        
    }
}
