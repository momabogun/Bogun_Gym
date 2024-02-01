//
//  ExerciseDetailView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Binding var path : NavigationPath
    let exercise: ExerciseEntity
    var body: some View {
        VStack{
            Text(exercise.name ?? "")
        }
    }
}
