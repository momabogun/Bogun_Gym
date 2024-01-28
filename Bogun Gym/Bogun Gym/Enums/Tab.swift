//
//  Tabs.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
import SwiftUI
enum Tab: String,CaseIterable,Identifiable{
    case home,shop,chats,myworkout,settings
    
    var id: String{rawValue}
    
    var title: String{
        switch self{
            
        case .home:
            "Home"
        case .shop:
            "Shop"
        case .chats:
            "Chats"
        case .myworkout:
            "My Workouts"
        case .settings:
            "Settings"
            
        }
    }
    
    
    var icon: String{
        switch self{
            
        case .home:
            "house.fill"
        case .shop:
            "cart.fill"
        case .chats:
            "message.fill"
        case .myworkout:
            "dumbbell.fill"
        case .settings:
            "gear"
        }
    }
    
    var view: AnyView {
        switch self{
            
            
        case .home:
            AnyView(HomeView())
        case .shop:
            AnyView(ShopView())
        case .chats:
            AnyView(ChatsView())
        case .myworkout:
            AnyView(MyWorkoutListView())
        case .settings:
            AnyView(SettingsView())
            
        }
    }
}
