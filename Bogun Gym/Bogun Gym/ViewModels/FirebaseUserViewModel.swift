//
//  FirebaseUserViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class FirebaseUserViewModel: ObservableObject{
    
    
    private let firebaseManager = FirebaseManager.shared
    
    @Published var user: FireProfile?
    
    private var listener: ListenerRegistration?
    
    
    var userIsLoggenIn: Bool{
        user != nil
    }
    
    
    private func checkAuth(){
        guard let currentUser = firebaseManager.auth.currentUser else{
            print("Not logged in")
            return
        }
        
    
    }
    
    
    func login(email: String, password: String){
        firebaseManager.auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else {
                return
            }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.fetchUser(with: authResult.user.uid)
            
        }
    }
    
    
    func register(email: String, password: String){
        firebaseManager.auth.createUser(withEmail: email, password: password){ authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            
            self.createUser(with: authResult.user.uid, email: email)
            
            self.login(email: email, password: password)
            
        }
    }
    
    
    private func createUser(with id: String, email: String){
        let user = FireProfile(id: id, email: email)
        
        do{
            try firebaseManager.database.collection("Profile").document(id).setData(from: user)
        } catch{
            print("fehler beim speichern des users: \(error)")
        }
    }
    
    
    
    
    
    
    private func fetchUser(with id: String){
        let userRef = firebaseManager.database.collection("Profile").document(id)
        self.listener = userRef.addSnapshotListener{ documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching user: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                if document.exists{
                    let user = try document.data(as: FireProfile.self)
                    self.user = user
                }
                else{
                    print("Document does not exist")
                }
            }
            catch {
                print("Error decoding user: \(error.localizedDescription)")
            }
  
        }
    }
    
}
