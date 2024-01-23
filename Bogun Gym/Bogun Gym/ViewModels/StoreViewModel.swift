//
//  StoreViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import Foundation
import CoreData
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class StoreViewModel: ObservableObject {
    
    
    let container = PersistentStore.shared
    private let firebaseManager = FirebaseManager.shared
    private var listener: ListenerRegistration?
    @Published var supplements :  [Supplement] = []
    @Published var cartSupplements: [Supplement] = []
    @Published var bills = [Bill]()
    @Published var search = ""
    
    
    
    init() {
        fetchSupplements()
    }
    
    
    deinit {
        listener?.remove()
        print("listener is off")
    }
    
    
    func filterSupplementsByText() {
        guard !search.isEmpty else {
            fetchSupplements()
            return
        }
        
        let request = NSFetchRequest<Supplement>(entityName: "Supplement")
        request.predicate = NSPredicate(format: "name CONTAINS %@", search)
        
        do {
            supplements = try container.context.fetch(request)
        } catch {
            print("error fetching: \(error)")
        }
    }
    
    
    
    
    
    private func fetchSupplements(){
        let request : NSFetchRequest<Supplement> = Supplement.fetchRequest()
        
        do {
            let count = try container.context.count(for: request)
            if count == 0 {
                addPredefinedSupplements()
            }
            supplements = try container.context.fetch(request)
        } catch {
            fatalError("Failed to fetch tasks: \(error)")
        }
    }
    
    private func addPredefinedSupplements() {
        let supplementNames = [
                    "Alanine", "BCAA", "Casein", "Creatine", "Fat Burner", "Glutamin", "Grow Hormone", "L-Arginin",
                    "Mass Gainer", "Omega 3", "Pre Workout", "Pre Workout-Special", "Testosterone", "Testosterone-Special",
                    "Whey Protein", "Zink"
                ]
                let supplementImages = [
                    "alanine", "bcaa", "casein", "creatine", "fatburner", "glutamin", "growhormone", "Larginin",
                    "massgainer", "omega3", "preworkout", "preworkout2", "test", "test2", "whey", "zink"
                ]
                let supplementPrices = [
                    23.99, 29.99, 35.90, 24.99, 42.90, 23.99, 45.99, 28.99,
                    38.99, 18.99, 29.99, 33.99, 44.99, 52.99, 43.99, 23.99
                ]
        
        for index in 0..<supplementNames.count {
            addSupplement(name: supplementNames[index], image: supplementImages[index], price: supplementPrices[index])
        }
    }
    
    
    


    
    
    private func addSupplement(name: String, image: String, quantity: Int16 = 1, price: Double) {
        let newSupplement = Supplement(context: container.context)
        newSupplement.name = name
            newSupplement.image = image
        newSupplement.quantity = quantity
            newSupplement.price = price
        newSupplement.isCarted = false
        newSupplement.id = UUID()
        container.save()
        }
    
    
    
    func cartedItem(_ supplement: Supplement, with isCarted: Bool){
        supplement.isCarted.toggle()
        container.save()
        fetchSupplements()
    }
    
    
    
    
    
    func addToCart(_ supplement: Supplement) {
        cartSupplements.append(supplement)
    }
    
    func removeFromCart(_ supplement: Supplement) {
        guard let index = cartSupplements.firstIndex(where: { $0.id == supplement.id }) else { return }
        cartSupplements.remove(at: index)
    }

    func containsItem(_ supplement: Supplement) -> Bool {
        cartSupplements.contains { $0.id == supplement.id }
    }
    
    func upgradeQuantity(_ supplement: Supplement, newQuantity: Int16) {
        supplement.quantity = newQuantity
    }
    
    func removeAll(){
        cartSupplements.removeAll()
        
    }
    
    
    
    func calculateTotal() -> Double {
        return cartSupplements.reduce(0) { $0 + $1.price * Double($1.quantity)}
    }
    
    func calculateItemCount() -> Int16 {
        return cartSupplements.reduce(0) { $0 + $1.quantity }
    }
    
    
    
    
    func setAllSupplementsNotCarted() {
        supplements.forEach { $0.isCarted = false }
    }
    
    
    func setAllSupplementsQuantity() {
        supplements.forEach { $0.quantity = 1 }
    }
    
    
    
}


extension StoreViewModel{
    
    func createBill(){
        
        guard let userId = firebaseManager.userId else {return}
        
        let bill = Bill(userId: userId, purshaseDate: Date(),totalPrice: calculateTotal())
        
        do {
            try firebaseManager.database.collection("Bills").addDocument(from: bill)
        }catch let error {
            print("Error while saving meal: \(error)")
        }
    }
    
    func fetchBills(){
        guard let userId = firebaseManager.userId else {return}
        
        self.listener = firebaseManager.database.collection("Bills")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Error while downloading Meals")
                    return
                }
                
                self.bills = documents.compactMap{ queryDocumentSnapshot -> Bill? in
                    try? queryDocumentSnapshot.data(as: Bill.self)
                }
            }
    }
    
    func removeListener(){
        // import with logout
        bills.removeAll()
        cartSupplements.removeAll()
        listener?.remove()
    }
}
