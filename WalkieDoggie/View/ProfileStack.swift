//
//  ProfileStack.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import SwiftUI

struct ProfileStack: View {
    var dogProfile: DogProfile
    @State var pictureCount = 0
    
    
    var body: some View {
        HStack{
            ImageProfile(picture: dogProfile.pictures[pictureCount])
        }.onTapGesture{
            if pictureCount < (dogProfile.pictures.count - 1){
                pictureCount += 1
            }
        }
    }
}

struct ImageProfile: View{
    var picture: String
    
    var body: some View{
        Image(picture)
    }
}



































struct ProfileStack_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStack(dogProfile: dogExample, pictureCount: 0)
    }
}
