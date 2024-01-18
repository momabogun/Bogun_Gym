//
//  AuthMode.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import Foundation
enum AuthMode{
    case login, register
    
    
    var title: String {
        switch self {
        case .login: return "Login"
        case .register: return "Register"
        }
    }
    
    var alternativeTitle: String {
        switch self {
        case .login: return "You don't have an account? Register  →"
        case .register: return "Already registered? Login →"
        }
    }
}
