//
//  ProfileStack.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import SwiftUI

struct ProfileStack: View {
    var dogProfile: DogProfile
    @State private var pictureCount = 0
    @State var isMoreInfoViewPresented = false
    
    var body: some View {
        ZStack{
            ImageProfile(picture: dogProfile.pictures[pictureCount])
            DataProfile(name: dogProfile.name, age: dogProfile.age, distance: 2)
            
//            Button("Snow more") {
//                isMoreInfoViewPresented = true
//                    }
//                    .sheet(isPresented: $isMoreInfoViewPresented) {
//                        MoreInfoView(dogProfile: dogProfile)
//                    }
            
        }.onTapGesture{
            if pictureCount < (dogProfile.pictures.count - 1){
                pictureCount += 1
            }
        }
    }
        
}


struct MoreInfoView: View {
    var dogProfile: DogProfile
    
    var body: some View {
        Text("More")
    }
}

struct DataProfile: View{
    var name: String
    var age: Int
    var distance: Int
    
    var body: some View{
        VStack(alignment: .leading){
            HStack(alignment: .lastTextBaseline) {
                Text(name + ",")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                Text("\(age) y.o.")
                    .font(.system(size: 20))
            }
            HStack{
                Image(systemName: "paperplane")
                Text("\(distance)km away")
                    .font(.system(size: 17, weight: .semibold))
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: 350, maxHeight: 650, alignment: .topLeading)
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
        ProfileStack(dogProfile: dogExample)
    }
}
