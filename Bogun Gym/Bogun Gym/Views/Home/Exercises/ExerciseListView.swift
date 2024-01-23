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
                VStack{
                    ForEach(exerciseViewModel.exercises, id: \.id){ exercise in
                        ExerciseView(exercise: exercise)
                            .padding(.horizontal,20)
                            .environmentObject(exerciseViewModel)
                    }
                }.navigationTitle(bodyPart.title ?? "").navigationBarTitleDisplayMode(.inline)
            }
        }.onAppear{
            exerciseViewModel.fetchExercises(for: bodyPart)
        }
        
    }
}

