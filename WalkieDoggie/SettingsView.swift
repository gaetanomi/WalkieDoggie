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
                        Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
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
