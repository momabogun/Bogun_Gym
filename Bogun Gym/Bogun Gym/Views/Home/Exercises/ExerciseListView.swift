//
//  ExerciseListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseListView: View {
    @Binding var path : NavigationPath
    @EnvironmentObject var exerciseViewModel: ExercisesViewModel
    @ObservedObject var bodyPart: BodyPart
    var body: some View {
            ScrollView(showsIndicators: false) {
                
                ForEach(exerciseViewModel.exercises.filter{(exerciseViewModel.search.isEmpty ? true : $0.name!.localizedCaseInsensitiveContains(exerciseViewModel.search))}){ exercise in
                        NavigationLink(value: exercise){
                            ExerciseView(exercise: exercise)
                                .padding(.horizontal,20)
                                .navigationTitle(bodyPart.title?.capitalized ?? "").navigationBarTitleDisplayMode(.inline)
                        }
                            
                    }
                .searchable(text: $exerciseViewModel.search)
                    
            }.onAppear{
            exerciseViewModel.fetchExercises(for: bodyPart)
        }
        
    }
}

