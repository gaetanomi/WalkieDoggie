//
//  ProfileStack.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import SwiftUI
import CoreLocation

struct ProfileStack: View {
    var dogProfile: DogProfile
    @State private var pictureCount = 0
    @State var isMoreInfoViewPresented = false
    
    
    var body: some View {
        ZStack{
            ImageProfile(picture: dogProfile.pictures[pictureCount])
                .onTapGesture { location in
                    if location.x >  300
                    {
                        if pictureCount < (dogProfile.pictures.count - 1){
                            pictureCount += 1
                        }
                    } else {
                        if pictureCount > 0 {
                            pictureCount -= 1
                        }
                    }
                }
                .overlay{
                    DataProfile(name: dogProfile.name, age: dogProfile.age, distance: "dd")
                }
            moreInfo
        }
    }
    
    var moreInfo: some View{
        Button(action: {
               isMoreInfoViewPresented = true
        }){
            Image(systemName: "info.circle")
                .font(Font.system(.title))
            
        }
           .sheet(isPresented: $isMoreInfoViewPresented) {
               MoreInfoView(dogProfile: dogProfile, pictureCount: pictureCount)
           }
           .frame(maxWidth: 350, maxHeight: 650, alignment: .bottomTrailing)
           .foregroundColor(Color.black)
    }
    
}

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

struct DataProfile: View{
    var name: String
    var age: Int
    var distance: String
    
    var body: some View{
        VStack(alignment: .leading){
            NameAgeDog(name: name, age: age)
            DistanceDog(distance: distance)
        }
        .padding(6)
        .foregroundColor(.white)
        .background(Color(UIColor.gray))
        .cornerRadius(10.0)
        .frame(maxWidth: 350, maxHeight: 650, alignment: .topLeading)
    }
}


struct DistanceDog: View{
    
    var distance: String
    
    var body: some View{
        HStack{
            Image(systemName: "paperplane")
            Text("\(distance)")
                .font(.system(size: 17, weight: .semibold))
        }
    }
}

struct NameAgeDog: View{
    var name: String
    var age: Int
    
    var body: some View{
            HStack(alignment: .lastTextBaseline) {
                Text(name + ",")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                if (age == 1){
                    Text("\(age) year")
                        .font(.system(size: 20))
                } else {
                    Text("\(age) years")
                        .font(.system(size: 20))
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
    
struct ImageProfile: View{
    var picture: String
    
    var body: some View{
        Image(picture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.top)
    }
}



































struct ProfileStack_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStack(dogProfile: ProfilesViewModel().dogsProfiles[4])
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(dogProfile: ProfilesViewModel().dogsProfiles[0], pictureCount: 0)
    }
}
