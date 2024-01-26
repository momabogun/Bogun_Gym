//
//  MyWorkoutViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
import FirebaseFirestore
import CoreData
import FirebaseFirestoreSwift
@MainActor
class MyWorkoutViewModel: ObservableObject{
    
    @Published var myWorkouts = [MyWorkout]()
    @Published var pickedExercisesId: Set<String> = []
    @Published var pickedExercises = [ExerciseEntity]()
    let container = PersistentStore.shared
    
    
    @Published var search = ""
    
    
    private var listener: ListenerRegistration?
    
    private let firebaseManager = FirebaseManager.shared
    
    func toggleSelection(for exerciseId: String) {
        if pickedExercisesId.contains(exerciseId) {
            pickedExercisesId.remove(exerciseId)
        } else {
            pickedExercisesId.insert(exerciseId)
        }
    }
    
    func removeAllPicked(){
        pickedExercisesId.removeAll()
    }
    
    
    init(){
        fetchMyWorkouts()
    }
    
    
    
    
    
    func createWorkout(name: String){
        
        guard let userId = firebaseManager.userId else {return}
        
        let myWorkout = MyWorkout(userId: userId, workouts: Array(pickedExercisesId), name: name, timestamp: Date())
        
        do {
            try firebaseManager.database.collection("MyWorkouts").addDocument(from: myWorkout)
        }catch let error {
            print("Error while saving workout: \(error)")
        }
    }
    
    
    func fetchMyWorkoutExercises(withIds exerciseIds: [String]){
        let request: NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id IN %@", exerciseIds)
        
        request.sortDescriptors = [NSSortDescriptor(key: "target", ascending: true)]
        
        do{
            self.pickedExercises = try container.context.fetch(request)
        } catch{
            fatalError("Failed to fetch exercises: \(error)")
        }
        
    }
    
    
    
    
    
    func fetchExercisesInMyWorkout(workoutId: String){
        
        firebaseManager.database.collection("MyWorkouts").document(workoutId).getDocument{ document, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            if let document = document {
                    do {
                        let workoutDocuments = try document.data(as: MyWorkout.self)
                        let exercisesIDs = workoutDocuments.workouts
                        self.fetchMyWorkoutExercises(withIds: exercisesIDs)
                        
                    }
                catch {
                            print(error)
                          }
                    
                    
                }
            }
        }
    
    
    
    
    
    
    
    func fetchMyWorkouts(){
        guard let userId = firebaseManager.userId else {return}
        
        
        self.listener = firebaseManager.database.collection("MyWorkouts")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Error while downloading Workouts")
                    return
                }
                
                self.myWorkouts = documents.compactMap{ queryDocumentSnapshot -> MyWorkout? in
                    try? queryDocumentSnapshot.data(as: MyWorkout.self)
                }
            }
    }
    
    
    
    func deleteMyWorkout (with id: String){
        firebaseManager.database.collection("MyWorkouts").document(id).delete(){ error in
            if let error {
                print("Workout cannot be deleted", error.localizedDescription)
                return
            }
            
            print("Workout with ID \(id) is deleted")
            
        }
    }
    
    func removeListener(){
        // import with logout
        myWorkouts.removeAll()
        listener?.remove()
    }
    

    
}
