//
//  Goals.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
enum Goal: String, CaseIterable, Identifiable{
    case maintain, mildlose, weightlose,extremelose,mildgain,weightgain,extremegain
    
    var id: String{rawValue}
    
    var title: String{
        switch self{
            
        case .maintain:
            "Maintain weight"
        case .mildlose:
            "Mild weight loss"
        case .weightlose:
            "Weight loss"
        case .extremelose:
            "Extreme weight loss"
        case .mildgain:
            "Mild weight gain"
        case .weightgain:
            "Weight gain"
        case .extremegain:
            "Extreme weight gain"
        }
    }
}
