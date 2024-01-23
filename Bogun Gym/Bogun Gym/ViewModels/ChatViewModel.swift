//
//  ChatViewModel.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class ChatViewModel: ObservableObject{
    
    private let firebaseManager = FirebaseManager.shared
    private var listener: ListenerRegistration?
    @Published var chats = [Chat]()
    @Published var search = ""
    
    init(){
        fetchChats()
    }
    
    
    
    deinit {
        listener?.remove()
        print("listener is off")
    }
    

    
    
    func createChat(title: String){
    
        
        let chat = Chat(title: title)
        
        do {
            try firebaseManager.database.collection("Chats").addDocument(from: chat)
        }catch let error {
            print("Error while saving meal: \(error)")
        }
    }
    
    func fetchChats(){
        
        self.listener = firebaseManager.database.collection("Chats")
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Error while downloading Meals")
                    return
                }
                
                self.chats = documents.compactMap{ queryDocumentSnapshot -> Chat? in
                    try? queryDocumentSnapshot.data(as: Chat.self)
                }
            }
    }
    
    func removeListener(){
        // import with logout
        chats.removeAll()
        listener?.remove()
    }
}
