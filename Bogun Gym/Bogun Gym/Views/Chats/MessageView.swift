//
//  MessageView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 21.01.24.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    @EnvironmentObject var messageViewModel: MessageViewModel
    @State private var user: FireProfile?
    @State var profileShown: Bool = false
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    if user?.profilePic != nil {
                        AsyncImage(url: URL(string: user?.profilePic ?? "")) { image in
                            image
                                .resizable()
                            
                            
                        }placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .cornerRadius(30)
                        
                        
                    } else{
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .cornerRadius(30)
                        
                    }
                    Text(user?.name ?? "")
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
        }.onTapGesture {
            profileShown.toggle()
        }.onAppear {
            messageViewModel.fetchUserProfile(userId: message.userId){ profile in
                user = profile
            }
        }.sheet(isPresented: $profileShown) {
            ProfileSheet(profile: user)
                .presentationDetents([.medium,.large])
        }
    }
    
    func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d. MMMM yyyy HH:mm:ss"
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: date)
        }
}


