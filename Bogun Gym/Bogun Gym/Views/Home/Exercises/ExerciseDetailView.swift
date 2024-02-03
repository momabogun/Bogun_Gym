//
//  ExerciseDetailView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI
import Giffy
struct ExerciseDetailView: View {
    @Binding var path : NavigationPath
    let exercise: ExerciseEntity
    var body: some View {
        
            VStack{
                AsyncGiffy(url: URL(string: exercise.gifUrl ?? "")!){ phase in
                    switch phase {
                    case .loading:
                        ProgressView()
                    case .error:
                        Text("Failed to load GIF")
                    case .success(let giffy):
                        giffy
                    }
                    VStack(alignment: .leading){
                        Text("Instructions").font(.title3).bold().foregroundStyle(.accent)
                            .padding(.horizontal,10)
                        ScrollView{
                            
                            Text(exercise.instructions ?? "")
                                
                        }
                    }.padding()
                    
                }.navigationTitle(exercise.name?.capitalized ?? "").navigationBarTitleDisplayMode(.inline)
            }
        }
    
}
