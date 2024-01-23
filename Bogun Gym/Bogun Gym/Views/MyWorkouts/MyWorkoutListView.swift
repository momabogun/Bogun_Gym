//
//  MyWorkoutListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import SwiftUI

struct MyWorkoutListView: View {
    @StateObject var myWorkoutViewModel = MyWorkoutViewModel()
    var body: some View {
        NavigationStack {
            Group {
                if myWorkoutViewModel.myWorkouts.isEmpty {
                    placeholder
                } else {
                    list
                }
            }
        }
    }
    
    
    private var placeholder: some View {
        NavigationStack{
            VStack(spacing: 15) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Image("myworkout")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                VStack{
                    Text("Unleash your potential")
                        .foregroundStyle(.accent)
                    Text("Design your Ultimate Workout Today")
                }
                .frame(height: 200)
                .multilineTextAlignment(.center)
                .padding()
                .font(.largeTitle)
                //            PrimaryButton(title: "Get Started", action: {})
                //                    .padding()
                NavigationLink("Get Started", destination: CreateMyWorkoutView())
                    .font(.title)
                    .buttonStyle(.bordered)
            }
        }
    }
    
    private var list: some View {
        VStack{
            List(myWorkoutViewModel.myWorkouts) { workout in
                MyWorkoutView(workout: workout)
                    .swipeActions {
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
            
            
        }
    }
}

#Preview {
    MyWorkoutListView()
}
