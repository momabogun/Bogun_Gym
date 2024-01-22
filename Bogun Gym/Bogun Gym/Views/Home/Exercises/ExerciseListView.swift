//
//  ExerciseListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseListView: View {
    init(bodyPart: BodyPart) {
        self._exerciseViewModel = StateObject(wrappedValue: ExercisesViewModel(bodyPart: bodyPart))
    }
    @StateObject var exerciseViewModel :ExercisesViewModel
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    ForEach(exerciseViewModel.exercises, id: \.id){ exercise in
                        ExerciseView(exercise: exercise)
                            .padding(.horizontal,20)
                            .environmentObject(exerciseViewModel)
                    }
                }.navigationTitle(exerciseViewModel.bodyPart.title?.capitalized ?? "").navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

