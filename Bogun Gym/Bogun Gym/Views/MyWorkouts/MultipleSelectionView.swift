//
//  MultipleSelectionView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 24.01.24.
//

import SwiftUI

struct MultipleSelectionRow: View {
    let exercise : ExerciseEntity
    var isSelected: Bool
    var action: () -> Void
    @EnvironmentObject var myWorkoutViewModel : MyWorkoutViewModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: exercise.gifUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    
            } placeholder: {
                Image(systemName: "dumbbell.fill")
            }.frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(exercise.name?.capitalized ?? "")
            Spacer()
            if isSelected {
                Image(systemName: "circle.fill")
                    .foregroundColor(.accent)
            } else{
                Image(systemName: "circle")
                    .foregroundColor(.accent)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
        
    }
    
}


