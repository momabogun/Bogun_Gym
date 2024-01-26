//
//  Icon.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import Foundation
import SwiftUI
enum SettingsItem: String,CaseIterable,Identifiable{
    case account, calculator, help, share
    
    var id: String {rawValue}
    
    var image: String{
        switch self{
            
        case .account:
            "key.fill"
        case .calculator:
            "figure.strengthtraining.functional"
        case .help:
            "info.square.fill"
        case .share:
            "heart.square.fill"
        }
    }
    
    var title: String{
        switch self{
            
        case .account:
            "Account"
        case .calculator:
            "Fitness Calculator"
       
        case .help:
            "Help"
        case .share:
            "Tell a Friend"
        }
    }
}
