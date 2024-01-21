//
//  MyWorkoutView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct MyWorkoutView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @State private var search = ""
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
        }
        
        
    }
    
    
    private var list: some View {
        VStack(spacing: 10) {
            List(BodyPart.allCases.filter{(self.search.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(self.search))}, id:\.id){
                Text($0.title)
            }.searchable(text: $search)
        }.navigationTitle("My Workouts")
            
    }
}
