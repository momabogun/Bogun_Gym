//
//  Exercise.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
struct Exercise: Codable{
    var id: String
    var name: String
    var gifUrl: String
    var equipment: String
    var target: String
    var instructions: [String]
}
