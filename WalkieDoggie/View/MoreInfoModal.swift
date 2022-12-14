//
//  MoreInfoModal.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 13/12/22.
//

import SwiftUI
import CoreLocation

struct MoreInfoView: View {
    var dogProfile: DogProfile
    var pictureCount: Int
    var distance: String {
        return LocationService().distanceCalculation(otherDogLocation: CLLocation(latitude: dogProfile.latitude, longitude: dogProfile.longitude))
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Image(dogProfile.pictures[pictureCount])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading){
                    NameAgeDog(name: dogProfile.name, age: dogProfile.age)
                    Spacer(minLength: -3)
                    BreedSexDog(breed: dogProfile.breed, sex: dogProfile.sex)
                    Spacer(minLength: 4)
                    DistanceDog(distance: distance)
                    Spacer(minLength: 10)
                    Text(dogProfile.description)
                }
                .padding()
            }
        }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(dogProfile: ProfilesViewModel().dogsProfiles[0], pictureCount: 0)
    }
}
