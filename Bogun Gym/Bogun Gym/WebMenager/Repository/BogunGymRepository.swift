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
    
    static func fetchIdealWeright(gender: String, height: Int) async throws -> IdealWeight{
        
        let headers = ApiKeys.fitnessCalHeader
        
        guard let url = URL(string: "https://fitness-calculator.p.rapidapi.com/idealweight?gender=\(gender)&height=\(height)") else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Debugging: Print data received
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON: \(jsonString ?? "Invalid JSON")")
                
                let result = try JSONDecoder().decode(IdealWeightInResponse.self, from: data)
                return result.data
            } catch {
                throw error
            }
        
        
    }
    
    
    static func fetchBmi(age: Int, weight: Int, height: Int) async throws -> Bmi{
        
        let headers = ApiKeys.fitnessCalHeader
        
        guard let url = URL(string: "https://fitness-calculator.p.rapidapi.com/bmi?age=\(age)&weight=\(weight)&height=\(height)") else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Debugging: Print data received
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON: \(jsonString ?? "Invalid JSON")")
                
                let result = try JSONDecoder().decode(BmiInResponse.self, from: data)
                return result.data
            } catch {
                throw error
            }
        
        
    }
    
    static func fetchDailyReq(age: Int, weight: Int, height: Int, activity: String, gender: String) async throws -> DailyCaloryReq{
        
        let headers = ApiKeys.fitnessCalHeader
        
        guard let url = URL(string: "https://fitness-calculator.p.rapidapi.com/dailycalorie?age=\(age)&gender=\(gender)&height=\(height)&weight=\(weight)&activitylevel=\(activity)") else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Debugging: Print data received
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON: \(jsonString ?? "Invalid JSON")")
                
                let result = try JSONDecoder().decode(DailyCaloryReqInResponse.self, from: data)
                return result.data
            } catch {
                throw error
            }
        
        
    }
    
    static func fetchBodyFat(age: Int, weight: Int, height: Int, activity: String, gender: String, neck: Int, waist: Int, hip: Int) async throws -> BodyFat{
        
        let headers = ApiKeys.fitnessCalHeader
        
        guard let url = URL(string: "https://fitness-calculator.p.rapidapi.com/bodyfat?age=\(age)&gender=\(gender)&weight=\(weight)&height=\(height)&neck=\(neck)&waist=\(waist)&hip=\(hip)") else{
            throw HTTPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = ApiKeys.get
        request.allHTTPHeaderFields = headers
        
        do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Debugging: Print data received
                let jsonString = String(data: data, encoding: .utf8)
                print("Received JSON: \(jsonString ?? "Invalid JSON")")
                
                let result = try JSONDecoder().decode(BodyFatInResponse.self, from: data)
                return result.data
            } catch {
                throw error
            }
        
        
    }
    
    
    
    
    
    
}
