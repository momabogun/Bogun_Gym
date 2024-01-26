//
//  HomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @StateObject var bodyViewModel = BodyPartViewModel()
    @StateObject var myWorkoutViewModel = MyWorkoutViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
        ]
    var body: some View {
        NavigationStack{
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
                    }.padding(5)
                }.toolbar{
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


#Preview {
    HomeView()
}
