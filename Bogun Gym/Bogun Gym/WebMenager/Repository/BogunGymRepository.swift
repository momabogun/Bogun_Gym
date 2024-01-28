//
//  ExercisesRepository.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
class BogunGymRepository{
    
    
    static func fetchAllExercises() async throws -> [Exercise]{
        
        let headers = ApiKeys.exercisesDbHeader
        
        guard let url = URL(string: ApiKeys.exerciseDbUrl) else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode([Exercise].self, from: data)
        
        
        
        
    }
    
    
    static func fetchBmi(age: Int, weight: Int, height: Int) async throws -> Bmi{
        
        let headers = ApiKeys.fitnessCalHeader
        
        guard let url = URL(string: ApiKeys.fitnessCalUrl + "bmi?age=\(age)&weight=\(weight)&height\(height)") else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let result = try JSONDecoder().decode(BmiInResponse.self, from: data)
        
        return result.data
        
        
    }
    
    
    
    
    
    
}
