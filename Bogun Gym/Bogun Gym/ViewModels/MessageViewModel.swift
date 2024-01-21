//
//  MessageViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class MessageViewModel: ObservableObject{
    
    
    
    
    private let firebaseManager = FirebaseManager.shared
    private var listener: ListenerRegistration?
    @Published var messages = [Message]()
    @Published var text = ""
    let chat: Chat
    
    
    let user: FireProfile
    
    
    init(chat: Chat, user: FireProfile){
        self.chat = chat
        self.user = user
    }
    
    deinit {
        listener?.remove()
        print("listener is off")
    }
    
    
    
    func createMessage(content: String){
        
        guard let userId = firebaseManager.userId else {return}
        
        let message = Message(userId: userId, chatId: chat.id ?? "", content: content, timestamp: Date(), userName: user.name)
        
        do {
            try firebaseManager.database.collection("Messages").addDocument(from: message)
        }catch let error {
            print("Error while saving meal: \(error)")
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
                    print("Error while downloading Meals")
                    return
                }
                
                self.messages = documents.compactMap{ queryDocumentSnapshot -> Message? in
                    try? queryDocumentSnapshot.data(as: Message.self)
                }
            }
    }
    
    func removeListener(){
        // import with logout
        messages.removeAll()
        listener?.remove()
    }
}
