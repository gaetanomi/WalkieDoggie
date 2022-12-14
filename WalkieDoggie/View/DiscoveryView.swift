//
//  DiscoveryView.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import SwiftUI

struct DiscoveryView: View {
    var dogsProfiles = ProfilesViewModel().dogsProfiles
//    @State private var dogsCount = 0
    @State var pictureCount = 0
    @State var offset = CGFloat(0)
//    var swipeMinDistance: Double = 10
//    var swipeMaxDistance: Double = 250
    
    var body: some View {
//        GeometryReader { geometry in
//            ZStack{
//                ProfileStack(dogProfile: dogs[dogsCount], pictureCount: $pictureCount)
//                    .frame(width: geometry.size.width)
//            }.gesture(
//                DragGesture().onEnded({ value in
//                    print(value.translation.width)
//                    if value.translation.width < 0 {
//                        if abs(value.translation.width) < swipeMaxDistance, abs(value.translation.width) > swipeMinDistance, dogsCount < (dogs.count - 1) {
//                            dogsCount += 1
//                            pictureCount = 0
//                        }
//                    }
//                    else if value.translation.width > 0 {
//                        if value.translation.width < swipeMaxDistance, value.translation.width > swipeMinDistance, dogsCount - 1 >= 0 {
//                            dogsCount -= 1
//                            pictureCount = 0
//                        }
//                    }
//                })
//            )
//        }
        
        
        GeometryReader{ geometry in
            
            ZStack{
                
                ForEach(dogsProfiles.reversed()) { profile in
                    
                    ProfileStack(dogProfile: profile, pictureCount: $pictureCount, offset: $offset, frame: geometry.frame(in: .global))
                }
                
            }
            
        }
        .padding([.horizontal, .bottom])
        
        
        
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
