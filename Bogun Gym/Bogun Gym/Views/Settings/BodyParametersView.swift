//
//  BodyParametersView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct BodyParametersView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var fitnessViewModel = FitnessCalculatorViewModel()
    @State private var age: Double = 25
    @State private var height: Double = 178
    @State private var weight : Double = 70
    @State private var neck: Double = 50
    @State private var waist: Double = 96
    @State private var hip: Double = 92
    @State private var gender: String = "Male"
    @State private var activity: String = ActivityLevel.level_1.rawValue
    @State private var goal: String = Goal.maintain.rawValue
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Age"){
                        SliderView(value: $age, start: 15, end: 80, string: "Age", messurment: "years")
                    }
                    Section("Gender"){
                        Picker("Gender", selection: $gender){
                            ForEach(fitnessViewModel.genders, id:\.self){
                                Text($0)
                            }
                        }
                    }
                    Section("Height"){
                        SliderView(value: $height, start: 130, end: 230, string: "Height", messurment: "cm")
                    }
                    Section("Weight"){
                        SliderView(value: $weight, start: 40, end: 160, string: "Weight", messurment: "kg")
                    }
                    Section("Neck"){
                        SliderView(value: $neck, start: 20, end: 80, string: "Neck", messurment: "cm")
                    }
                    Section("Waist"){
                        SliderView(value: $waist, start: 40, end: 130, string: "Waist", messurment: "cm")
                    }
                    Section("Hip"){
                        SliderView(value: $hip, start: 40, end: 130, string: "Hip", messurment: "cm")
                    }
                    
                    Section("Activity"){
                        Picker("Activity",selection: $activity){
                            ForEach(ActivityLevel.allCases, id:\.id){
                                Text($0.title)
                                    .tag($0 as ActivityLevel)
                            }
                        }
                    }
                    Section("Goal"){
                        Picker("Goal",selection: $goal){
                            ForEach(Goal.allCases, id:\.id){
                                Text($0.title)
                                    .tag($0 as Goal)
                            }
                        }
                    }
                }
                PrimaryButton(title: "Done") {
                    authViewModel.updateProfileBiometrics(gender: gender, age: Int(age), weight: Int(weight), neck: Int(neck), waist: Int(waist), hip: Int(hip), activity: activity, goal: goal)
                }
            }.navigationTitle("Body Details").navigationBarTitleDisplayMode(.large)
        }.onAppear{
            if let userGender = authViewModel.user?.gender{
                gender = userGender
            }
            if let userAge = authViewModel.user?.age{
                age = Double(userAge)
            }
            if let userWeight = authViewModel.user?.weight{
                weight = Double(userWeight)
            }
            if let userNeck = authViewModel.user?.neck{
                neck = Double(userNeck)
            }
            if let userWaist = authViewModel.user?.waist{
                waist = Double(userWaist)
            }
            if let userHip = authViewModel.user?.hip{
                hip = Double(userHip)
            }
            if let userActiv = authViewModel.user?.activity{
                activity = userActiv
                            }
            if let userGoal = authViewModel.user?.goal{
                goal = userGoal
            }
        }
    }
}

#Preview {
    BodyParametersView()
}
