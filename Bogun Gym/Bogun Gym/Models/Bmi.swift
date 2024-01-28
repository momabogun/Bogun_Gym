//
//  Bmi.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation


struct BmiInResponse: Codable{
    var data: Bmi
}
struct Bmi: Codable{
    var bmi: Double
    var health: String
}
