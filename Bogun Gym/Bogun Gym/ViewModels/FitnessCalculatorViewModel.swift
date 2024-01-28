//
//  FitnessCalculatorViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
class FitnessCalculatorViewModel: ObservableObject{
    
    @Published var bmi: Bmi?
    
    @Published var genders = ["Male", "Female"]
    
    
    func fetchBmi(age: Int, weight: Int, height: Int){
        Task{
            do{
                self.bmi = try await BogunGymRepository.fetchBmi(age: age, weight: weight, height: height)
            } catch{
                print("Request bmi failed with error: \(error)")
            }
        }
    }
}
