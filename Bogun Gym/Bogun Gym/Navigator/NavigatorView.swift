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
            ForEach(Tab.allCases) { tab in
                tab.view
                    .tabItem {
                        Label(tab.title, systemImage: tab.icon)
                    }
                    .tag(tab)
            }
        }.environmentObject(authViewModel)
        
    }
    
    
}

#Preview {
    NavigatorView()
}
