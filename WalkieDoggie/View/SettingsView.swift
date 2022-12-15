//
//  SettingsView.swift
//  WalkieDoggie
//
//  Created by GaetanoMiranda on 07/12/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var gender = "male"
    let genders = ["male", "female", "both"]
    
    @StateObject var profileVM = ProfilesViewModel()
    
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Image(dogExample.pictures[0])
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 7)
                
                HStack(alignment: .bottom){
                    Text(dogExample.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("\(dogExample.age) y.o.")
                        .font(.title3)
                }
                
                
                List{
                    NavigationLink{
                        BreedsView()
                    } label: {
                        Text("Breeds")
                    }
                    
                    Section{
                        Picker("Sex", selection: $gender){
                            ForEach(genders, id: \.self){
                                Text($0)
                            }
                        } .pickerStyle(.segmented)
                        
                        
                    }
                header: {
                    Text("Select preferred gender")
                    
                }
                    Section{
                        Slider(value: $profileVM.distance, in: 0.0...10.0, minimumValueLabel: Text("0"), maximumValueLabel: Text("10"), label: {})
                      //  Stepper(value: $settingsVM.distance, in: 0...20) {
                            Text("\(profileVM.distance)")
                        
                        
                    }
                header: {
                    Text("Search dogs in the range of")
                    
                }
                    
                    
                    
                } .listStyle(.inset)
                
                
                
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Edit"){
                    //Add action
                }
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
