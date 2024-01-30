//
//  FirebaseUserViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject{
    
    @Published var bmi: Bmi?
    @Published var goal: DailyCaloryReq?
    @Published var bodyFat: BodyFat?
    @Published var idealWeight: IdealWeight?
    @Published var genders = ["male", "female"]
    private let firebaseManager = FirebaseManager.shared
    
    @Published var user: FireProfile?
    
    private var listener: ListenerRegistration?
    
    
    var userIsLoggenIn: Bool{
        user != nil
    }
    
    init(){
        checkAuth()
    }
    
    private func checkAuth(){
        guard let currentUser = firebaseManager.auth.currentUser else{
            print("Not logged in")
            return
        }
        
        self.fetchUser(with: currentUser.uid)
    
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
    
    
    func register(email: String, password: String, name: String){
        firebaseManager.auth.createUser(withEmail: email, password: password){ authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            
            self.createUser(with: authResult.user.uid, email: email, name: name)
            
            self.login(email: email, password: password)
            
        }
    }
    
    
    private func createUser(with id: String, email: String, name: String){
        let user = FireProfile(id: id, email: email, name: name)
        
        do{
            try firebaseManager.database.collection("Profiles").document(id).setData(from: user)
        } catch{
            print("fehler beim speichern des users: \(error)")
        }
    }
    
    
    
    
    
    
    private func fetchUser(with id: String){
        let userRef = firebaseManager.database.collection("Profiles").document(id)
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
    
    
    func logout(){
        do{
            try firebaseManager.auth.signOut()
            self.user = nil
            print("User wurde abgemeldet!")
        } catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
    
}
extension AuthViewModel{
    
    
    func updateProfile(about: String, name: String){
        let data = [
            "about": about,
            "name": name,
        ]
        
        firebaseManager.database.collection("Profiles").document(firebaseManager.userId ?? "").setData(data, merge: true){ error in
            if let error {
                print("Profile not updated", error.localizedDescription)
                return
                
            }
            print("Profile Updated")
            
        }
        
    }
    
    func updateProfileBiometrics(gender: String, age: Int, weight: Int, neck: Int,waist: Int, hip: Int, activity: String, goal: String, height: Int){
        let data = [
            "gender" : gender,
            "height" : height,
            "age" : age,
            "weight" : weight,
            "neck" : neck,
            "waist" : waist,
            "hip" : hip,
            "activity" : activity,
            "goal" : goal
        ] as [String : Any]
        
        firebaseManager.database.collection("Profiles").document(firebaseManager.userId ?? "").setData(data, merge: true){ error in
            if let error {
                print("Profile not updated", error.localizedDescription)
                return
                
            }
            print("Profile Updated")
            
        }
        
    }
    
    
    func fetchBmi(){
        Task{
            do{
                let bmi = try await BogunGymRepository.fetchBmi(age: user?.age ?? 0, weight: user?.weight ?? 0, height: user?.height ?? 0)
                self.bmi = bmi
            } catch{
                print("Request bmi failed with error: \(error)")
            }
        }
    }
    
    
    func fetchDailyReq(){
        Task{
            do{
                let goal = try await BogunGymRepository.fetchDailyReq(age: user?.age ?? 0, weight: user?.weight ?? 0, height: user?.height ?? 0, activity: user?.activity ?? "", gender: user?.gender ?? "")
                self.goal = goal
            }catch{
                print("Request daily requered failed with error: \(error)")
            }
        }
    }
    
    func fetchBodyFat(){
        Task{
            do{
                let bodyFat = try await BogunGymRepository.fetchBodyFat(age: user?.age ?? 0, weight: user?.weight ?? 0, height: user?.height ?? 0, activity: user?.activity ?? "", gender: user?.gender ?? "", neck: user?.neck ?? 0, waist: user?.waist ?? 0, hip: user?.hip ?? 0)
                self.bodyFat = bodyFat
            }catch{
                print("Request body fat failed with error: \(error)")
            }
        }
    }
    
    func fetchIdealWeight(){
        Task{
            do{
                let ideal = try await BogunGymRepository.fetchIdealWeright(gender: user?.gender ?? "", height: user?.height ?? 0)
                self.idealWeight = ideal
            }catch{
                print("Request ideal weight failed with error: \(error)")
            }
        }
    }
    
    
   
    
    
    
    
}
