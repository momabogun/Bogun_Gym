//
//  ExercisesViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
import CoreData
@MainActor
class ExercisesViewModel: ObservableObject{
    
    @Published var exercises = [ExerciseEntity]()
    let container = PersistentStore.shared
    
    
    
    @Published var search = ""
    
    
    init(){
        fetchExercises()
    }
    
    
    
    
    func searchForExercises(){
        let request : NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS %@", search)
        do{
            exercises = try container.context.fetch(request)
        }catch {
            fatalError("Failed to fetch exercises: \(error)")
        }
    }
    
 
    
    
    
    
    func fetchExercises(for bodyPart: BodyPart? = nil){
        let request : NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        if let bodyPart = bodyPart, let bodyPartId = bodyPart.id {
            request.predicate = NSPredicate(format: "bodyPart.id == %@", bodyPartId as CVarArg)
        }
        request.sortDescriptors = [NSSortDescriptor(key: "target", ascending: true)]
        
        do {
            let count = try container.context.count(for: request)
            if count == 0 {
                fetchExercisesAPI()
            }
            exercises = try container.context.fetch(request)
        } catch {
            fatalError("Failed to fetch exercises: \(error)")
        }
    }
    
    

    
    
    func addExercisesFromAPI(exercises: [Exercise]){
        
        
        
        let context = container.context
        
        for exercise in exercises{
            let entity = ExerciseEntity(context: context)
            entity.id = UUID().uuidString
            entity.name = exercise.name
            entity.gifUrl = exercise.gifUrl
            entity.equipment = exercise.equipment
            entity.target = exercise.target
            entity.instructions = exercise.instructions.joined(separator: "\n")
            entity.isPicked = false
            if let bodyPart = fetchOrCreateBodyPartEntity(for: exercise.target){
                entity.bodyPart = bodyPart
            }
            
            
        }
        
        container.save()
        
        
    }
    
    
    
    
    
    
    
    func fetchOrCreateBodyPartEntity(for target: String) -> BodyPart? {
        // Implement logic to fetch or create BodyPartEntity based on the target
        
        let request: NSFetchRequest<BodyPart> = BodyPart.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", target)

        do {
            let results = try container.context.fetch(request)
            if let existingBodyPartEntity = results.first {
                return existingBodyPartEntity
            } else {
                let newBodyPartEntity = BodyPart(context: container.context)
                newBodyPartEntity.title = target
                newBodyPartEntity.image = target
                newBodyPartEntity.id = UUID()
                container.save()
                return newBodyPartEntity
            }
        } catch {
            print("Error fetching BodyPart: \(error)")
            return nil
        }
    }

    
    
    func fetchExercisesAPI(){
        Task{
            do{
                let exercises = try await ExercisesRepository.fetchAllExercises()
                addExercisesFromAPI(exercises: exercises)
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
}


