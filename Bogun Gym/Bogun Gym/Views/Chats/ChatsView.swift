//
//  ChatView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct ChatsView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @StateObject var chatViewModel = ChatViewModel()
    @State var sheetCreateChat = false
    var body: some View {
        NavigationStack{
            Group {
                if authViewModel.userIsLoggenIn{
                    list
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        .padding()
                }
            }
        }.onAppear{
            chatViewModel.fetchChats()
        }
        
        
        
        
    }
    
    
    private var list: some View {
        VStack(spacing: 10) {
            List(chatViewModel.chats.filter{(chatViewModel.search.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(chatViewModel.search))}){ chat in
                NavigationLink {
                    MessageListView(chat: chat)
                } label: {
                    Text(chat.title)
                }

            }.searchable(text: $chatViewModel.search)
        }.navigationTitle("Topics")
            .sheet(isPresented: $sheetCreateChat){
                CreateChatSheet(isShown: $sheetCreateChat)
                    .environmentObject(chatViewModel)
                    .presentationDetents([.height(200)])
            }
            .toolbar{
                ToolbarItem{
                    Button(action: showSheet){
                        Image(systemName: "plus.circle.fill")
                    }
                    
                }
                
            }
    }
    
    func showSheet(){
        sheetCreateChat.toggle()
    }
}
