//
//  MainView.swift
//  WalkieDoggie
//
//  Created by Irina Deeva on 09/12/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DiscoveryView()
                .tabItem {
                    Label("Discovery", systemImage: "bolt.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
