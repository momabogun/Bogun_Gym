//
//  NavigatorView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct NavigatorView: View {
    @StateObject var authViewModel = AuthViewModel()
    @State private var homeNavigationStack: NavigationPath = NavigationPath()
    @State private var myWorkoutNavigationStack: NavigationPath = NavigationPath()
    @State private var shopNavigationStack: NavigationPath = NavigationPath()
    @State private var chatNavigationStack: NavigationPath = NavigationPath()
    @State private var settingsNavigationStack: NavigationPath = NavigationPath()
    @State private var selectedTab: Tab = .home
    var body: some View {
        TabView (selection: tabSelection()){
            HomeView(path: $homeNavigationStack)
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.icon)
                }.tag(Tab.home)
            ShopView(path: $shopNavigationStack)
                .tabItem {
                    Label(Tab.shop.title, systemImage: Tab.shop.icon)
                }.tag(Tab.shop)
            ChatsView(path: $chatNavigationStack)
                .tabItem {
                    Label(Tab.chats.title, systemImage: Tab.chats.icon)
                }.tag(Tab.chats)
            MyWorkoutListView(path: $myWorkoutNavigationStack)
                .tabItem {
                    Label(Tab.myworkout.title, systemImage: Tab.myworkout.icon)
                }.tag(Tab.myworkout)
            SettingsView(path: $settingsNavigationStack)
                .tabItem {
                    Label(Tab.settings.title, systemImage: Tab.settings.icon)
                }.tag(Tab.settings)
            }.environmentObject(authViewModel)
        }
        
    }

#Preview {
    NavigatorView()
}

extension NavigatorView {
 
 private func tabSelection() -> Binding<Tab> {
    Binding { //this is the get block
     self.selectedTab
    } set: { tappedTab in
         if homeNavigationStack.isEmpty {
                //User already on home view, scroll to top
               } else {
               //Pop to root view by clearing the stack
                   homeNavigationStack = .init()
               }
        if myWorkoutNavigationStack.isEmpty{
            
        } else {
            myWorkoutNavigationStack = .init()
        }
        
        if settingsNavigationStack.isEmpty{
            
        } else {
            settingsNavigationStack = .init()
        }
        
        if shopNavigationStack.isEmpty{
            
        } else {
            shopNavigationStack = .init()
        }
        if chatNavigationStack.isEmpty{
            
        } else {
            chatNavigationStack = .init()
        }

     
     //Set the tab to the tabbed tab
     self.selectedTab = tappedTab
    }
 }
}


