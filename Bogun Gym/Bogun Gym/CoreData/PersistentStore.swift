//
//  PersistentStore.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import Foundation
import Foundation
import CoreData

struct PersistentStore{
    
    static var shared = PersistentStore()
    
    private let container: NSPersistentContainer
    var context: NSManagedObjectContext{
        container.viewContext
    }
    
    init(){
        container = NSPersistentContainer(name: "SupplementsData")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error loading Core Data: \(error), \(error.userInfo)")
            }
        }
    }
    
    
    func save(){
        guard context.hasChanges else{
            return
        }
    
    
    do{
        try context.save()
    } catch let error as NSError{
        NSLog("Unresolve error saving context: \(error), \(error.userInfo)")
    }
}
}
    
    

