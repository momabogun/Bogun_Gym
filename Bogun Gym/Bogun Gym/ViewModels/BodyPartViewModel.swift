//
//  BodyPartViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
import CoreData
class BodyPartViewModel: ObservableObject{
    
    let container = PersistentStore.shared
    @Published var bodyParts = [BodyPart]()
    
    init(){
        fetchBodyParts()
        
    }
    
    
    func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExerciseEntity")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try container.context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                container.context.delete(objectData)
            }
        } catch let error {
            print("Detele all data inerror :", error)
        }
    }
    
    
    private func fetchBodyParts(){
        let request : NSFetchRequest<BodyPart> = BodyPart.fetchRequest()
        
        do {
            let count = try container.context.count(for: request)
            if count == 0 {
                addPredefinedBodyParts()
            }
            bodyParts = try container.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    private func addPredefinedBodyParts() {
        let bodyPartNames = [
            "abs","biceps","calves","delts","forearms","glutes","hamstrings","lats","pectorals","quads","spine","traps","triceps"
                ]
                let bodyPartImages = [
                    "abs","biceps","calf","back","forearm","gluteus","hamstring","lats","chest","legs","spine","traps","triceps"
                ]
                
        
        for index in 0..<bodyPartNames.count {
            addBodyPart(title: bodyPartNames[index], image: bodyPartImages[index])
        }
    }
    
    
    private func addBodyPart(title: String, image: String) {
        let newBodyPart = BodyPart(context: container.context)
        newBodyPart.id = UUID()
        newBodyPart.image = image
        newBodyPart.title = title
        container.save()
        }
    
}
