//
//  ProfilePicView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct ProfilePicView: View {
    @State var isShown: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
            
            VStack{
                if authViewModel.user?.profilePic == nil {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                } else{
                    
                    AsyncImage(url: URL(string: authViewModel.user?.profilePic ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    }placeholder: {
                        ProgressView().progressViewStyle(.circular)
                    }
                }
                
        }.sheet(isPresented: $isShown, content: {
            EditProfilePicSheet(isShown: $isShown)
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


