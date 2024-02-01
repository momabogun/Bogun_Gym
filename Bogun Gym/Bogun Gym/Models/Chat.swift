//
//  Chat.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import Foundation
import FirebaseFirestoreSwift
struct Chat: Codable, Identifiable, Hashable{
    
    @DocumentID var id: String?
    var title: String
    
}
