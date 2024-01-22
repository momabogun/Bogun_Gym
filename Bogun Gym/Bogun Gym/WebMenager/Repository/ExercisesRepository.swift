//
//  ExercisesRepository.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
class ExercisesRepository{
    
    
    static func fetchAllExercises() async throws -> [Exercise]{
        
        let headers = ApiKeys.header
        
        guard let url = URL(string: ApiKeys.exerciseTargetUrl) else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode([Exercise].self, from: data)
        
        
        
        
    }
    
    
    
    
    
    
}
