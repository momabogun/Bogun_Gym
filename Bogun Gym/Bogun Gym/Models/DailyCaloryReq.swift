//
//  DailyCaloryReq.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import Foundation
struct DailyCaloryReqInResponse: Codable{
    var data: DailyCaloryReq
    
    
}

struct DailyCaloryReq: Codable{
    var BMR: Double
    var goals: DailyCaloryGoal
}

struct DailyCaloryGoal: Codable{
    var maintainWeight: Double
        var mildWeightLoss: WeightLoss
        var weightLoss: WeightLoss
        var extremeWeightLoss: WeightLoss
        var mildWeightGain: WeightGain
        var weightGain: WeightGain
        var extremeWeightGain: WeightGain
    
    
    enum CodingKeys: String, CodingKey {
            case maintainWeight = "maintain weight"
            case mildWeightLoss = "Mild weight loss"
            case weightLoss = "Weight loss"
            case extremeWeightLoss = "Extreme weight loss"
            case mildWeightGain = "Mild weight gain"
            case weightGain = "Weight gain"
            case extremeWeightGain = "Extreme weight gain"
       
        }
}

struct WeightLoss: Codable {
    var lossWeight: String
    var calory: Double
    
    private enum CodingKeys: String, CodingKey {
        case lossWeight = "loss weight"
        case calory
    }
}

struct WeightGain: Codable {
    var gainWeight: String
    var calory: Double
    
    enum CodingKeys: String, CodingKey {
        case gainWeight = "gain weight"
        case calory
    }
}

