//
//  DogProfileInfoView.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 14/12/22.
//

import SwiftUI

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
