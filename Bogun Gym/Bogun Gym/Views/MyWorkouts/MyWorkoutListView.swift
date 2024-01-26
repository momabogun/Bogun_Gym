//
//  MyWorkoutListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import SwiftUI

struct MyWorkoutListView: View {
    @StateObject var myWorkoutViewModel = MyWorkoutViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            Group {
                if authViewModel.userIsLoggenIn{
                    if myWorkoutViewModel.myWorkouts.isEmpty {
                        placeholder
                    } else {
                        list
                    }
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        .padding()
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
                
                NavigationLink("Get Started", destination: CreateMyWorkoutView().environmentObject(myWorkoutViewModel))
                    .font(.title)
                    .buttonStyle(.bordered)
            }
        }
    }
    
    private var list: some View {
        VStack{
            List(myWorkoutViewModel.myWorkouts.filter{(myWorkoutViewModel.search.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(myWorkoutViewModel.search))}) { workout in
                NavigationLink(destination: MyWorkoutView(workout: workout).environmentObject(myWorkoutViewModel), label: {
                    Text(workout.name)
                })
                    
                    .swipeActions {
                        Button(role: .destructive) {
                            myWorkoutViewModel.deleteMyWorkout(with: workout.id ?? "")
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    
            }.onAppear{
                myWorkoutViewModel.fetchMyWorkouts()
            }.searchable(text: $myWorkoutViewModel.search)
            
            
        }.navigationTitle("My Workouts")
            .toolbar{
                ToolbarItem{
                    NavigationLink(destination: CreateMyWorkoutView().environmentObject(myWorkoutViewModel)) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
    }
}

#Preview {
    MyWorkoutListView()
}
