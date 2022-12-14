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
    @Binding var pictureCount: Int
    @State var isMoreInfoViewPresented = false
    var frame: CGRect
    
    var distance: String {
        return LocationService().distanceCalculation(otherDogLocation: CLLocation(latitude: dogProfile.latitude, longitude: dogProfile.longitude))
    }
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
            ImageProfile(picture: dogProfile.pictures[pictureCount], frame: frame)
                
            
            LinearGradient(gradient: .init(colors: [Color.black.opacity(0), Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)

            VStack(spacing: 15){
                HStack{
                    DataProfile(name: dogProfile.name, age: dogProfile.age, distance: distance)
                    Spacer(minLength: 0)
                }
            }
            .padding()
            moreInfo
        }
        .cornerRadius(20)
        .onTapGesture { location in
            if location.x > frame.width/2
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
           .frame(maxWidth: frame.maxX - 50, maxHeight: frame.maxY - 50, alignment: .bottomTrailing)
           .foregroundColor(Color.black)
    }
    
}




































//
//struct ProfileStack_Previews: PreviewProvider {
//    @State static var pictureCount = 0
//    
//    static var previews: some View {
//        ProfileStack(dogProfile: ProfilesViewModel().dogsProfiles[4], pictureCount: $pictureCount, frame: <#CGRect#>)
//    }
//}

