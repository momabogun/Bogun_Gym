//
//  MyWorkoutView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import SwiftUI

struct MyWorkoutView: View {
    @EnvironmentObject var myWorkoutViewModel: MyWorkoutViewModel
    let workout: MyWorkout
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    ForEach(myWorkoutViewModel.pickedExercises, id: \.id){ exercise in
                        ExerciseView(exercise: exercise)
                            .padding(.horizontal,20)
                    }
                }.navigationTitle(workout.name).navigationBarTitleDisplayMode(.inline)
            }
        }.onAppear{
            myWorkoutViewModel.fetchExercisesInMyWorkout(workoutId: workout.id ?? "")
        }
        
    }
}


    
    
    
    


