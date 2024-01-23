//
//  BodyPartViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import Foundation
import CoreData


@MainActor
class BodyPartViewModel: ObservableObject{
    
    let container = PersistentStore.shared
    
    @Published var bodyParts = [BodyPart]()
    
    init(){
        fetchBodyParts()
        
    }
    
    private func fetchBodyParts(){
        let request : NSFetchRequest<BodyPart> = BodyPart.fetchRequest()
        
        do {
            bodyParts = try container.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    
    
}
