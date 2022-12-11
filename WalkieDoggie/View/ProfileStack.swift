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
    @State var index: Int = 0
    @State var maxIndex: Int
    @State private var offset = CGFloat.zero
    @State private var dragging = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    HStack(alignment: .center, spacing: 0) {
                        ForEach(dogProfile.pictures, id: \.self) { picture in
                            ZStack() {
                                Rectangle()
                                    .fill(.orange)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(10)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            /* ImageProfile(picture: picture)
                             .frame(width: geometry.size.width, height: geometry.size.height)*/
                        }
                    }
                }
                .content
                .offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.dragging = true
                            self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                            print(self.offset)
                        }
                        .onEnded { value in
                            let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                            let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                            self.index = self.clampedIndex(from: predictedIndex)
                            withAnimation(.easeOut) {
                                self.dragging = false
                            }
                        }
                )
            }
        }
    }
    
    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            print(self.offset, self.maxIndex, geometry.size.width)
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }
    
    func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
        guard newIndex >= 0 else { return 0 }
        guard newIndex <= maxIndex else { return maxIndex }
        return newIndex
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
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.top)
            .scaledToFill()
    }
}


struct ProfileStack_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStack(dogProfile: dogExample, maxIndex: dogExample.pictures.count)
    }
}


//.frame(width: geometry.size.width, height: geometry.size.height)
