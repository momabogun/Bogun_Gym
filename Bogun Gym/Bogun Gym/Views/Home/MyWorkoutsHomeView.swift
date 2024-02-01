//
//  MyWorkoutsHomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 25.01.24.
//

import SwiftUI

struct MyWorkoutsHomeView: View {
    @EnvironmentObject var myWorkoutViewModel: MyWorkoutViewModel
    var body: some View {
                
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 20){
                            ForEach(myWorkoutViewModel.myWorkouts){ workout in
                                NavigationLink(value: workout) {
                                    
                                    VStack{
                                        VStack{
                                            Image(systemName: "dumbbell.fill")
                                                .font(.title)
                                                .padding(30)
                                        }.background{
                                            Color.accent.opacity(0.4)
                                        }.cornerRadius(25)
                                        
                                        
                                        Text(workout.name)
                                            .font(.system(size: 10))
                                    }
                                    
                                }
                            }
                        }
                
            }
        .padding(.horizontal, 10)
    }
}

#Preview {
    MyWorkoutsHomeView()
}
