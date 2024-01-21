//
//  ExerciseListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseListView: View {
    init(target: String) {
        self._exerciseViewModel = StateObject(wrappedValue: ExercisesViewModel(target: target))
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
                }.navigationTitle(exerciseViewModel.target.capitalized).navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

