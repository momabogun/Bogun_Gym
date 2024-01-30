//
//  IdealWeight.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
struct IdealWeightInResponse: Codable{
    var data: IdealWeight
}

struct IdealWeight: Codable{
    var hamwi: Double
    var devine: Double
    var miller: Double
    var robinson: Double
    enum CodingKeys: String, CodingKey{
        case hamwi = "Hamwi"
        case devine = "Devine"
        case miller = "Miller"
        case robinson = "Robinson"
        
        
    }
}
