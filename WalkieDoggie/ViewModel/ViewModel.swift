//
//  ViewModel.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import Foundation

class ProfilesViewModel: ObservableObject{
    
    init(){
        
    filteredDogs = filterByDistance(originalArray: dogsProfiles, maxdistance: 10)
    }
    
    
    @Published var filteredDogs:[DogProfile]
    @Published var distance = 10.0
    
    
    var dogsProfiles = [leo, loki, shakh, kiraQueen, ciri, altai, albus, lui]
    
    func filterByDistance(originalArray: [DogProfile], maxdistance: Int) -> [DogProfile] {
        var newArray = originalArray
        for number in newArray {
            if number.distanceFromMe > maxdistance {
                newArray.remove(at: newArray.firstIndex(of: number)!)
            }
        }
        filteredDogs = newArray
       return filteredDogs
    }

    
    
}
