//
//  Ads.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
enum Ad: String, CaseIterable, Identifiable{
    case first,second, third, fourth
    
    var id : String {rawValue}
    
    
    var image: String{
        
        switch self{
            
        case .first:
            "advert1"
        case .second:
            "advert2"
        case .third:
            "advert3"
        case .fourth:
            "advert4"
        }
    }
}
