//
//  SwiftUIView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 24.01.24.
//

import SwiftUI

struct DisclosureGroupBodyParts: View {
    @StateObject var bodyPartViewModel = BodyPartViewModel()
    @EnvironmentObject var myWorkoutViewModel : MyWorkoutViewModel
    var body: some View {
            ForEach(bodyPartViewModel.bodyParts){ part in
                DisclosureGroup(part.title?.capitalized ?? "") {
                    
                    PickedExercisesView(bodyPart: part)
                        .environmentObject(myWorkoutViewModel)
                    
                }
            
        }
    }
    
    
}






