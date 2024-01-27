//
//  ProfilePicView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct ProfilePicView: View {
    let user: FireProfile
    @State var isShown: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                
                    AsyncImage(url: URL(string: user.profilePic ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            
                    }placeholder: {
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                    }
                
            }.sheet(isPresented: $isShown, content: {
                EditProfilePicSheet(user: user, isShown: $isShown)
                    .presentationDetents([.height(250)])
            }).navigationTitle("Profile Photo").toolbar{
                ToolbarItem{
                    Button("Edit"){
                        isShown.toggle()
                    }
                }
            }
        }
    }
}


