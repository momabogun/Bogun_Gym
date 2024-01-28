//
//  FireProfile.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import Foundation
struct FireProfile: Codable{
    var id: String
    var email: String
    var name: String
    var profilePic: String?
    var about: String?
    var gender: String?
    var age: Int?
    var weight: Int?
    var neck: Int?
    var waist: Int?
    var hip: Int?
    var activity: String?
    var goal: String?
}
