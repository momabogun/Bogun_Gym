//
//  BmiView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct BmiView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Text("BMI - Body mass index")
                        Spacer()
                        Text(String(authViewModel.bmi?.bmi ?? 0) + " kg/m2")
                    }
                    HStack{
                        Text("Health")
                        Spacer()
                        Text(authViewModel.bmi?.health ?? "")
                    }
                }
            }.navigationTitle("BMI")
        }
    }
}

#Preview {
    BmiView()
}
