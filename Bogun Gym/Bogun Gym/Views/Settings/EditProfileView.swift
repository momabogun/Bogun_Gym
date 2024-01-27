//
//  EditProfileView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var editedText :String
    @State private var aboutEdit: String
    init(user: FireProfile){
        _editedText = State(initialValue: user.name)
        _aboutEdit = State(initialValue: user.about ?? "")
    }
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    NavigationLink(destination: ProfilePicView(user: authViewModel.user!)) {
                        
                        
                        HStack{
                            VStack{
                                AsyncImage(url: URL(string: authViewModel.user?.profilePic ?? "")) { image in
                                    image
                                        .resizable()
                                        
                                        
                                }placeholder: {
                                    Image("profile")
                                        .resizable()
                                        
                                }
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)
                                
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
                    Text(authViewModel.user!.email)
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
        }
    }
}
    
 


