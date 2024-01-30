//
//  MessageListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct MessageListView: View {
    init(chat: Chat){
        self._messageViewModel = StateObject(wrappedValue: MessageViewModel(chat: chat))
    }
    @StateObject var messageViewModel: MessageViewModel
    var body: some View {
        VStack{
            ScrollView{
                ForEach(messageViewModel.messages.sorted(by: {$0.timestamp.compare($1.timestamp) == .orderedAscending})){ message in
                    if message.userId == FirebaseManager.shared.userId{
                        HStack{
                            Spacer()
                            MessageView(message: message)
                                .environmentObject(messageViewModel)
                                .background{
                                    Color.accentColor.cornerRadius(25)
                                }
                                .frame(maxWidth: 250)
                        }
                    } else{
                        HStack{
                            MessageView(message: message)
                                .environmentObject(messageViewModel)
                                .background{
                                    Color.gray.opacity(0.3).cornerRadius(25)
                                }.frame(maxWidth: 250)
                            Spacer()
                        }
                    }
                    
                    
                }
                
            }.onAppear{
                    messageViewModel.fetchMessages()
                
            }.defaultScrollAnchor(.bottom)
            
            AddMessageView()
                .environmentObject(messageViewModel)
        }
    }
    
    
}


