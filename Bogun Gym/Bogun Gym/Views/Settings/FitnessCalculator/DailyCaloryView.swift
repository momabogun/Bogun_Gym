//
//  DailyCaloryView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct DailyCaloryView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Text("BMR - Basal Metabolic Rate: ")
                        Spacer()
                        Text(String(authViewModel.goal?.BMR ?? 0) + " cal")
                    }
                    HStack{
                        Text("To maintain weight: ")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.maintainWeight ?? 0) + " cal")
                    }
                    HStack{
                        Text("To lose \(authViewModel.goal?.goals.mildWeightLoss.lossWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.mildWeightLoss.calory ?? 0) + " cal")
                    }
                    HStack{
                        Text("To lose \(authViewModel.goal?.goals.weightLoss.lossWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.weightLoss.calory ?? 0) + " cal")
                    }
                    HStack{
                        Text("To lose \(authViewModel.goal?.goals.extremeWeightLoss.lossWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.extremeWeightLoss.calory ?? 0) + " cal")
                    }
                    HStack{
                        Text("To gain \(authViewModel.goal?.goals.mildWeightGain.gainWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.mildWeightGain.calory ?? 0) + " cal")
                    }
                    
                    HStack{
                        Text("To gain \(authViewModel.goal?.goals.weightGain.gainWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.weightGain.calory ?? 0) + " cal")
                    }
                    
                    HStack{
                        Text("To gain \(authViewModel.goal?.goals.extremeWeightGain.gainWeight ?? "")")
                        Spacer()
                        Text(String(authViewModel.goal?.goals.extremeWeightGain.calory ?? 0) + " cal")
                    }
                }
            }.navigationTitle("Daily Calory Requirments")
        }
    }
}

#Preview {
    DailyCaloryView()
}
