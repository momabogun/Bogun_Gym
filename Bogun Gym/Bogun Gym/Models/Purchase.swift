//
//  CartSupplements.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import Foundation
import FirebaseFirestoreSwift
struct Purchase: Codable, Identifiable{
    @DocumentID var id: String?
    
    var userId: String
    var purshaseDate: Date
    var totalPrice: Double
}
