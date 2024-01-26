//
//  ExerciseListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseListView: View {
    
    @StateObject var exerciseViewModel = ExercisesViewModel()
    @ObservedObject var bodyPart: BodyPart
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                
                    ForEach(exerciseViewModel.exercises){ exercise in
                        ExerciseView(exercise: exercise)
                            .padding(.horizontal,20)
                            .navigationTitle(bodyPart.title?.capitalized ?? "").navigationBarTitleDisplayMode(.inline)
                            
                    }
                .searchable(text: $exerciseViewModel.search).onChange(of: exerciseViewModel.search) {
                    exerciseViewModel.searchForExercises()
            }
                    
            }
        }.onAppear{
            exerciseViewModel.fetchExercises(for: bodyPart)
        }
        
    }
}

