//
//  EditProfileView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var editedText: String = ""
    @State private var aboutEdit: String = ""
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    NavigationLink(destination: ProfilePicView()) {
                        
                        
                        HStack{
                            VStack{
                            if authViewModel.user?.profilePic == nil {
                                Image("profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                            } else{
                                
                                    AsyncImage(url: URL(string: authViewModel.user?.profilePic ?? "")) { image in
                                        image
                                            .resizable()
                                        
                                        
                                    }placeholder: {
                                        ProgressView().progressViewStyle(.circular)
                                        
                                    }
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(50)
                                }
                                    
                                    Button("Edit"){
                                        
                                    }
                                }
                            
                            Text("Enter your name and add an optional profile picture")
                                .font(.footnote)
                                .opacity(0.5)
                                .padding()
                        }
                    }
                    TextEditor(text: $editedText)

                }
                Section("EMAIL"){
                    Text(authViewModel.user?.email ?? "")
                }
                
                Section("ABOUT"){
                    TextEditor(text: $aboutEdit)
                }
            }.navigationTitle("Edit Profile").navigationBarTitleDisplayMode(.inline).toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel"){
                        dismiss()
                    }
                    
                }
                ToolbarItem {
                    Button("Done"){
                        authViewModel.updateProfile(about: aboutEdit, name: editedText)
                        dismiss()
                    }
                    
                }
            }.navigationBarBackButtonHidden(true)
        }.onAppear{
            if let initialName = authViewModel.user?.name {
                        editedText = initialName
                    }
                    if let initialAbout = authViewModel.user?.about {
                        aboutEdit = initialAbout
                    }
        }
    }
}
    
 


