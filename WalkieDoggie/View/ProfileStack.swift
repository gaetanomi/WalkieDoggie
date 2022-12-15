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
    @Binding var offset: CGFloat
    var frame: CGRect
    
    var distance: String {
        return LocationService().distanceCalculation(otherDogLocation: CLLocation(latitude: dogProfile.latitude, longitude: dogProfile.longitude))
    }
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)){
            ImageProfile(picture: dogProfile.pictures[pictureCount], frame: frame)
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
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                (offset > 0 ? Color.green: Color.red)
                    .opacity(offset != 0 ? 0.7:0)
                
                HStack{
                    if offset < 0 {
                     Spacer(minLength: 0)
                    }
                    Text(offset == 0 ? "" : (offset > 0 ? "Liked" : "Rejected"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,25)
                        .padding(.horizontal)
                    
                    if offset > 0 {
                     Spacer(minLength: 0)
                    }
                }
                
            }
            
            
            LinearGradient(gradient: .init(colors: [Color.black.opacity(0), Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            
            VStack(spacing: 15){

                HStack{
                    
                    VStack(alignment: .leading, spacing: 12){
                        NameAgeDog(name: dogProfile.name, age: dogProfile.age)
                        
                        DistanceDog(distance: distance)

                        
                    }.foregroundColor(.white)
                    Spacer(minLength: 0)
                }
                
            
                
                HStack(spacing: 35){
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            offset = -500
                            
                        }
                    }){
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(.red)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            offset = 500
                            
                        }
                    }){
                        Image(systemName: "checkmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(.green)
                            .clipShape(Circle())
                    }
                    Spacer(minLength: 0)
                }
            }
            .padding()
            
            moreInfo
        }
        .cornerRadius(20)
        .offset(x: offset)
        .rotationEffect(.init(degrees: offset == 0 ? 0 : (offset > 0 ? 12 : -12)))
        
        
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
        .frame(maxWidth: frame.maxX - 50 , maxHeight: frame.maxY - 50, alignment: .bottomTrailing)
        .foregroundColor(Color.black)
    }
    
}

struct DataProfile: View{
    var name: String
    var age: Int
    var distance: String
    
    var body: some View{
        VStack(spacing: 12){
            NameAgeDog(name: name, age: age)
            DistanceDog(distance: distance)
        }
        .foregroundColor(.white)
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
    var frame: CGRect
    
    var body: some View{
        Image(picture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: frame.width, height: frame.height)
    }
}



































//struct ProfileStack_Previews: PreviewProvider {
////    @State var pictureCount = 0
//    
//    static var previews: some View {
//        ProfileStack(dogProfile: ProfilesViewModel().dogsProfiles[4], pictureCount: .constant(0))
//    }
//}

