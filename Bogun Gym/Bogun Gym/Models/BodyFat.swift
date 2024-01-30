//
//  BodyFat.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
struct BodyFatInResponse: Codable{
    var data: BodyFat
}

struct BodyFat: Codable{
    var usnavy: Double
    var category: String
    var bodyFatMass: Double
    var leanBodyMass: Double
    var bmiMethod: Double
    
    enum CodingKeys: String, CodingKey {
            case usnavy = "Body Fat (U.S. Navy Method)"
            case category = "Body Fat Category"
            case bodyFatMass = "Body Fat Mass"
            case leanBodyMass = "Lean Body Mass"
            case bmiMethod = "Body Fat (BMI method)"
            
       
        }
}
