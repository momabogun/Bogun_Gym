//
//  ProfileView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @Binding var path: NavigationPath
    var body: some View {
        NavigationStack(path: $path){
            Group {
                if authViewModel.userIsLoggenIn{
                    SettingsListView(path: $path)
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        
                }
            }
            
        }
        
        
        
    }
    
    
    
}
