//
//  ProfileView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    var body: some View {
        NavigationStack{
            Group {
                if authViewModel.userIsLoggenIn{
                    list
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        .padding()
                }
            }
        }
        
        
    }
    
    
    private var list: some View {
        VStack(spacing: 10) {
            Button("Log Out"){
                authViewModel.logout()
            }
        }.navigationTitle("Profile")
            
    }
}
