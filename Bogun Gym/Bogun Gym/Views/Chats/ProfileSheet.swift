//
//  ProfileSheet.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 29.01.24.
//

import SwiftUI

struct ProfileSheet: View {
    let profile: FireProfile?
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.accent.frame(height: 100)
            VStack{
                HStack(spacing: 25){
                    if profile?.profilePic != nil {
                        AsyncImage(url: URL(string: profile?.profilePic ?? "")) { image in
                            image
                                .resizable()
                            
                            
                        }placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(100)
                        
                        
                    } else{
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                        
                    }
                    Spacer()
                    HStack{
                        Text(profile?.name ?? "")
                            .font(.title)
                            .foregroundStyle(.black)
                            .bold()
                        if profile?.gender == "male"{
                            Text("♂")
                                .font(.largeTitle)
                                
                        }
                        if profile?.gender == "female"{
                            Text("♀")
                                .font(.largeTitle)
                                
                        }
                        
                            
                            
                        
                    }
                        
                    
                }
                
                Form{
                    Section("About"){
                        Text(profile?.about ?? "")
                            .font(.title3)
                    }
                   
                    Section{
                        
                        
                        HStack{
                            Text("Age")
                            Spacer()
                            Text(String(profile?.age ?? 0) + " years old")
                        }
                        
                        HStack{
                            Text("Height")
                            Spacer()
                            Text(String(profile?.height ?? 0) + " cm")
                        }
                        HStack{
                            Text("Weight")
                            Spacer()
                            Text(String(profile?.weight ?? 0) + " cm")
                        }
                    }
                    
                }
                    
                    
                    
            }.padding()
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSheet(profile: FireProfile(id: "1212", email: "sadsa", name: "miroljub",about: "dsadsada", gender: "female"))
    }
}
