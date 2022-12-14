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
                .onTapGesture { location in
                    if location.x >  frame.width/2
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

struct DataProfile: View{
    var name: String
    var age: Int
    var distance: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 12){
            NameAgeDog(name: name, age: age)
            DistanceDog(distance: distance)
        }.foregroundColor(.white)
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
    
struct ImageProfile: View{
    var picture: String
    var frame: CGRect
        
        var body: some View{
            Image(picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
                
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

