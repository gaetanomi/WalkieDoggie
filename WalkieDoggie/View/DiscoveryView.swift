//
//  DiscoveryView.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 08/12/22.
//

import SwiftUI

struct DiscoveryView: View {
    var dogs = ProfilesViewModel().dogsProfiles
    
    var body: some View {
        ProfileStack(dogProfile: dogs[0])
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}
