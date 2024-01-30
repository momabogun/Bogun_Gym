//
//  Message.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
import FirebaseFirestoreSwift
struct Message: Codable, Identifiable{
    
    @DocumentID var id: String?
    
    var userId: String
    var chatId: String
    var content: String
    var timestamp: Date
}
