//
//  HomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var authViewModel = FirebaseUserViewModel()
    var body: some View {
        NavigationStack{
        VStack{
            Text("Momcilo Bog")
        }.toolbar{
            ToolbarItem {
                NavigationLink {
                    if authViewModel.userIsLoggenIn{
                        ProfileView()
                    } else {
                        AuthView()
                            .environmentObject(authViewModel).padding()
                    }
                } label: {
                    Image(systemName: "person.crop.circle")
                }

            }
        }
        }
    }
}

#Preview {
    HomeView()
}
