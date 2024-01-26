//
//  MyWorkoutView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct CreateMyWorkoutView: View {
    @EnvironmentObject var myWorkoutViewModel :MyWorkoutViewModel
    @State var text = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        NavigationStack{
            VStack{
                VStack{
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Form{
                        Section("Workout name"){
                            TextField("Workout name", text: $text, axis: .vertical)
                                .frame(minHeight: 50)
                        }
                        Section{
                            DisclosureGroupBodyParts()
                                .environmentObject(myWorkoutViewModel)
                            
                        }
                            
                    }
                    
                }
                VStack{
                    PrimaryButton(title: "Save Workout"){
                        myWorkoutViewModel.createWorkout(name: text)
                        myWorkoutViewModel.removeAllPicked()
                        dismiss()
                    }
                        .disabled(text.isEmpty || myWorkoutViewModel.pickedExercisesId.isEmpty)
                }.padding()
            }
        }
    }
    

}
#Preview {
    CreateMyWorkoutView()
}
