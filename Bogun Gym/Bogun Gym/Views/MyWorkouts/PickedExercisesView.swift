//
//  PickedExercisesView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 24.01.24.
//

import SwiftUI

struct PickedExercisesView: View {
    let bodyPart : BodyPart
    @StateObject var exerciseViewModel = ExercisesViewModel()
    @EnvironmentObject var myWorkoutViewModel : MyWorkoutViewModel
    var body: some View {
        
        ForEach(exerciseViewModel.exercises){ exercise in
            if exercise.bodyPart == bodyPart{
                MultipleSelectionRow(exercise: exercise, isSelected: myWorkoutViewModel.pickedExercisesId.contains(exercise.id ?? "")){
                    myWorkoutViewModel.toggleSelection(for: exercise.id ?? "")
                        
                }.environmentObject(myWorkoutViewModel)
                    
            }
        }
                
        }
    }



