//
//  ProfileView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    
    var body: some View {
        NavigationStack{
            Group {
                if authViewModel.userIsLoggenIn{
                   SettingsListView()
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        .padding()
                }
            }
        }
        
        
    }
    
    
    
}
