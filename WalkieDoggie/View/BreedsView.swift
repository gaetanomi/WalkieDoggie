//
//  BreedsView.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 07/12/22.
//

import SwiftUI

struct BreedsView: View {
    var body: some View {
        
        List(Breed.allCases){breed in
            HStack{
                Text(breed.rawValue)
            }
            
        } .listStyle(.inset)
        
            .navigationTitle("Preferred Breeds")
    }
    
}

struct BreedsView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsView()
    }
}
