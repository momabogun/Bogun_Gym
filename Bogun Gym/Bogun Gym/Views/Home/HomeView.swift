//
//  HomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct HomeView: View {
    @Binding var path : NavigationPath
    @EnvironmentObject var authViewModel :AuthViewModel
    @StateObject var exerciseViewModel = ExercisesViewModel()
    @StateObject var myWorkoutViewModel = MyWorkoutViewModel()
    @StateObject var bodyPartViewModel = BodyPartViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
        ]
    var body: some View {
        NavigationStack(path: $path){
            ScrollView {
                VStack(alignment: .leading){
                    AdsView()
                    if authViewModel.userIsLoggenIn{
                        Divider()
                        Text("My Workouts").font(.title3).bold().foregroundStyle(.accent)
                            .padding(.horizontal,10)
                        MyWorkoutsHomeView()
                            .environmentObject(myWorkoutViewModel)
                        Divider()
                    }
                    Text("Exercises").font(.title3).bold().foregroundStyle(.accent)
                        .padding(.horizontal,10)
                    LazyVGrid(columns: columns, spacing: 20) {
                        BodyPartListView()
                            .environmentObject(bodyPartViewModel)
                            
                    }.padding(5)
                }
                .navigationDestination(for: BodyPart.self){
                    ExerciseListView(path: $path, bodyPart: $0)
                        .environmentObject(exerciseViewModel)
                }
                .navigationDestination(for: ExerciseEntity.self){
                    ExerciseDetailView(path: $path, exercise: $0)
                }
                .navigationDestination(for: MyWorkout.self){
                    MyWorkoutView(workout: $0, path: $path)
                        .environmentObject(myWorkoutViewModel)
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                }
                
                
            }
                                        
            
        }.onAppear{
            myWorkoutViewModel.fetchMyWorkouts()
        }
    }
    
    
    
    
    }



