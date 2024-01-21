//
//  Bogun_GymApp.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI
import Firebase



@main
struct Bogun_GymApp: App {
    
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
    
    var body: some Scene {
        
        WindowGroup {
            NavigatorView()
        }
    }
}
