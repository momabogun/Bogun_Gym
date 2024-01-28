//
//  MessageView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    if message.userPhoto == nil {
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .cornerRadius(30)
                    } else{
                        AsyncImage(url: URL(string: message.userPhoto ?? "")) { image in
                            image
                                .resizable()
                                
                                
                        }placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .cornerRadius(30)

                    }
                    Text(message.userName)
                        .font(.footnote)
                        .bold()
                }
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


