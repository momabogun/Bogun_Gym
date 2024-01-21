//
//  BodyPart.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
enum BodyPart :String, Identifiable, CaseIterable{
    case abs,biceps,calves,delts,forearms,glutes,hamstrings,lats,pectorals,quads,spine,traps,triceps
    
    var id: String{rawValue}
    
    var picture: String{
        switch self{
        case .abs:
            "abs"
        case .biceps:
            "biceps"
        case .calves:
            "calf"
        case .delts:
            "back"
        case .forearms:
            "forearm"
        case .glutes:
            "gluteus"
        case .hamstrings:
            "hamstring"
        case .lats:
            "lats"
        case .pectorals:
            "chest"
        case .quads:
            "legs"
        case .spine:
            "spine"
        case .traps:
            "traps"
        case .triceps:
            "triceps"
        }
    }
    
    
    var title:String{
        switch self{
            
        case .abs:
            "Abs"
        case .biceps:
            "Biceps"
        case .calves:
            "Calves"
        case .delts:
            "Delts"
        case .forearms:
            "Forearms"
        case .glutes:
            "Glutes"
        case .hamstrings:
            "Hamstrings"
        case .lats:
            "Back"
        case .pectorals:
            "Chest"
        case .quads:
            "Legs"
        case .spine:
            "Upper Back"
        case .traps:
            "Trapez"
        case .triceps:
            "Triceps"
        }
    }
}
