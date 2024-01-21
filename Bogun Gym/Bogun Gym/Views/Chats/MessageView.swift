//
//  MessageView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    @StateObject var authViewModel = AuthViewModel()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(message.userName)
                    .font(.footnote)
                    .bold()
                Spacer()
                Text(message.content)
                Text(formatDate(date:message.timestamp))
                    .font(.footnote)
                    .opacity(0.8)
            }
                .padding()
        }
    }
    
    func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d. MMMM yyyy HH:mm:ss"
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: date)
        }
}


