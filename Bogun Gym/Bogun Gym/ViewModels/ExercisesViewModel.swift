//
//  ExercisesViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import Foundation
import CoreData
class ExercisesViewModel: ObservableObject{
    
    @Published var exercises = [ExerciseEntity]()
    let container = PersistentStore.shared
    
    private var exercisesApi = [Exercise]()
    
    let bodyPart: BodyPart
    
    
    init(bodyPart: BodyPart){
        self.bodyPart = bodyPart
        fetchExercisesAPI(completion: { [weak self] in
            self?.fetchExercises()
        })
        
    }
    
    

    
    
    private func fetchExercises(){
        let request : NSFetchRequest<ExerciseEntity> = ExerciseEntity.fetchRequest()
        request.predicate = NSPredicate(format: "target == %@", bodyPart.title ?? "")
        
        do {
            let count = try container.context.count(for: request)
            if count == 0 {
                addExercisesFromAPI()
            }
            exercises = try container.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    func addExercisesFromAPI(){
        
        
        
        let context = container.context
        
        for exercise in self.exercisesApi{
            let entity = ExerciseEntity(context: context)
            entity.id = exercise.id
            entity.name = exercise.name
            entity.gifUrl = exercise.gifUrl
            entity.equipment = exercise.equipment
            entity.target = exercise.target
            entity.instructions = exercise.instructions.joined(separator: "\n")
            
        }
        
        container.save()
        fetchExercises()
        
        
    }

    
    
    func fetchExercisesAPI(completion: @escaping () -> Void){
        Task{
            do{
                self.exercisesApi = try await ExercisesRepository.fetchAllExercises()
                DispatchQueue.main.async {
                                completion()
                            }
            } catch{
                print("Request failed with error: \(error)")
            }
        }
    }
}
