//
//  FirebaseManager.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
class FirebaseManager{
    
    
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    let storage = Storage.storage()
    
    
    var userId: String? {
        auth.currentUser?.uid
    }
}
