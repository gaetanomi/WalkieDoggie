//
//  BreedsView.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 07/12/22.
//

import SwiftUI

struct BreedsView: View {
    var body: some View {
        
        List(breeds, id:\.self){breed in
            HStack{
                Text(breed)
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
