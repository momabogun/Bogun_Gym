//
//  MyWorkout.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
import FirebaseFirestoreSwift
struct MyWorkout: Codable,Identifiable{
    @DocumentID var id: String?
    
    var userId: String
    var workouts: [String]
    var name: String
    var timestamp: Date
}
