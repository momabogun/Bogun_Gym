//
//  MessageViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


@MainActor
class MessageViewModel: ObservableObject{
    
    
    
    
    private let firebaseManager = FirebaseManager.shared
    private var listener: ListenerRegistration?
    @Published var messages = [Message]()
    @Published var text = ""
    let chat: Chat
    
    
   
    
    
    init(chat: Chat){
        self.chat = chat
        
    }
    
    deinit {
        listener?.remove()
        print("listener is off")
    }
    
    
    
    func createMessage(content: String){
        
        guard let userId = firebaseManager.userId else {return}
        
        let message = Message(userId: userId, chatId: chat.id ?? "", content: content, timestamp: Date())
        
        do {
            try firebaseManager.database.collection("Messages").addDocument(from: message)
        }catch let error {
            print("Error while saving message: \(error)")
        }
    }
    
    
    func fetchUserProfile(userId: String,completion: @escaping (FireProfile?) -> Void) {
        let usersDocument = firebaseManager.database.collection("Profiles").document(userId)
        
        usersDocument.getDocument { document, error in
            if let document = document, document.exists{
                do{
                    let profile = try document.data(as: FireProfile.self)
                    completion(profile)
                } catch{
                    print("Error decoding profile data: \(error)")
                    completion(nil)
                }
                
            } else {
                       completion(nil)
                   }
            
        }
    }

    
    func fetchMessages(){
        
        self.listener = firebaseManager.database.collection("Messages")
            .whereField("chatId", isEqualTo: chat.id ?? "")
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Error while downloading Messages")
                    return
                }
                
                self.messages = documents.compactMap{ queryDocumentSnapshot -> Message? in
                    try? queryDocumentSnapshot.data(as: Message.self)
                }
            }
    }
    
    func removeListener(){
        
        listener?.remove()
    }
}
