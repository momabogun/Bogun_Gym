//
//  ActivityLevel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
enum ActivityLevel:String, CaseIterable, Identifiable{
    case level_1,level_2,level_3,level_4,level_5,level_6
    
    var id: String{rawValue}
    
    
    var title: String{
        switch self{
            
        case .level_1:
        "Sedentary: little or no exercise"
        case .level_2:
            "Exercise 1-3 times/week"
        case .level_3:
            "Exercise 4-5 times/week"
        case .level_4:
            "Daily exercise or intense exercise 3-4 times/week"
        case .level_5:
            "Intense exercise 6-7 times/week"
        case .level_6:
            "Very intense exercise daily, or physical job"
        }
    }
}
