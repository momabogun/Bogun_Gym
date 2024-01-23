//
//  MyWorkoutViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
@MainActor
class MyWorkoutViewModel: ObservableObject{
    
    @Published var myWorkouts = [MyWorkout]()
    
    
}
