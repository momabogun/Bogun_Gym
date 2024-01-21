//
//  CreateChatSheet.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct CreateChatSheet: View {
    @State var title = ""
    @Binding var isShown : Bool
    @EnvironmentObject var chatViewModel: ChatViewModel
    var body: some View {
        NavigationStack{
            Form{
                Section("Title"){
                    TextField("Title", text: $title)
                }
            }.navigationTitle("New Topic").navigationBarTitleDisplayMode(.inline).toolbar{
                ToolbarItem{
                    Button("Save"){
                        chatViewModel.createChat(title: title)
                        showSheet()
                    }.buttonStyle(.bordered)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button(action: showSheet, label: {
                        Image(systemName: "xmark.circle.fill")
                    })
                }
            }
        }
    }
    
    func showSheet(){
        isShown.toggle()
    }
}


