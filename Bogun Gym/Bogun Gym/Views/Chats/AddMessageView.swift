//
//  MessageView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct AddMessageView: View {
    @EnvironmentObject var messageViewModel: MessageViewModel
    var body: some View {
        HStack{
            TextField("Enter text", text: $messageViewModel.text, axis: .vertical)
                .frame(minHeight: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button{
                messageViewModel.createMessage(content: messageViewModel.text)
                messageViewModel.text = ""
            } label: {
                Image(systemName: "paperplane.circle.fill")
                    .font(.title)
            }

            }.padding()
        }
        
    }

#Preview {
    AddMessageView()
}
                   
