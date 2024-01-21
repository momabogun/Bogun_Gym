//
//  HomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @State var search = ""
    let columns = [
        GridItem(.adaptive(minimum: 150))
        ]
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(BodyPart.allCases, id: \.id) { part in
                        NavigationLink(destination: ExerciseListView(target: part.rawValue)){
                            VStack{
                                Image(part.picture)
                                    .resizable()
                                    .scaledToFill() .frame(width: 180, height: 200)
                                    .background(.gray)
                                    .cornerRadius(25.0)
                                Text(part.title)
                                    .font(.title3)
                                    .bold()
                                    .padding(5)
                                
                                
                            }.background{
                                Color.accent.opacity(0.4)
                                    .cornerRadius(25.0)
                            }
                        }
                    }
                        
                    }
            }.padding(5).navigationTitle("Hello, \(authViewModel.user?.name ?? "Guest")")

                
                            
        }        }
    }


#Preview {
    HomeView()
}
