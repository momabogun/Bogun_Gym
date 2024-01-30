//
//  FitnessCalListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct FitnessCalListView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        Form{
            Section{
                
                NavigationLink {
                    DailyCaloryView()
                        .environmentObject(authViewModel)
                } label: {
                    Text("Daily calory requirements")
                }
                NavigationLink {
                    BmiView()
                        .environmentObject(authViewModel)
                } label: {
                    Text("BMI")
                }
                
                NavigationLink {
                    BodyFatView()
                        .environmentObject(authViewModel)
                } label: {
                    Text("Body Fat Percentage")
                }
                
                NavigationLink {
                    IdealWeightView()
                        .environmentObject(authViewModel)
                } label: {
                    Text("Ideal weight")
                }

            }.onAppear{
                authViewModel.fetchBmi()
                authViewModel.fetchDailyReq()
                authViewModel.fetchBodyFat()
                authViewModel.fetchIdealWeight()
                    
            }
        }
    }
}

#Preview {
    FitnessCalListView()
}
