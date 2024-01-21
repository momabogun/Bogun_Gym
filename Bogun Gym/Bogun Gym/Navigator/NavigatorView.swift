//
//  NavigatorView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct NavigatorView: View {
    @StateObject var authViewModel = AuthViewModel()
    var body: some View {
        TabView {
            HomeView().tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ShopView().tabItem {
                Label("Shop", systemImage: "cart.fill")
            }
            ChatsView().tabItem {
                Label("Chats", systemImage: "message.fill")
            }
            MyWorkoutView().tabItem {
                Label("My Workouts", systemImage: "dumbbell.fill")
            }
            ProfileView().tabItem{
                Label("Profile", systemImage: "person.circle.fill")
            }
        }.environmentObject(authViewModel)
        
    }
    
    
}

#Preview {
    NavigatorView()
}
