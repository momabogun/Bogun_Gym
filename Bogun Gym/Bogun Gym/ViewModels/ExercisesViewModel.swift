//
//  ExercisesViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
class ExercisesViewModel: ObservableObject{
    
    @Published var exercises = [Exercise]()
    
    init(target: String){
        self.target = target
        fetchExercises()
    }
    
    let target: String
    
    
    func fetchExercises(){
        Task{
            do{
                self.exercises = try await ExercisesRepository.fetchAllExercises(target: target)
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
}
