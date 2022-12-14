//
//  MoreInfoView.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 14/12/22.
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


struct BreedSexDog: View{
    var breed: Breed
    var sex: Sex
    
    var body: some View{

            HStack(alignment: .lastTextBaseline) {
                Text(breed.rawValue + ",")
                    .font(.system(size: 28))
                switch sex {
                case .female:
                    Image("femenine")
                        .resizable()
                        .frame(width: 15, height: 15)
                case .male:
                    Image("masculine")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(dogProfile: ProfilesViewModel().dogsProfiles[0], pictureCount: 0)
    }
}
