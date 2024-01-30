//
//  BodyFatView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct BodyFatView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    HStack{
                        Text("Body Fat (U.S. Navy Method)")
                        Spacer()
                        Text(String(authViewModel.bodyFat?.usnavy ?? 0) + " %")
                    }
                    HStack{
                        Text("Body Fat Category")
                        Spacer()
                        Text(authViewModel.bodyFat?.category ?? "")
                    }
                    HStack{
                        Text("Body Fat Mass")
                        Spacer()
                        Text(String(authViewModel.bodyFat?.bodyFatMass ?? 0) + " %")
                    }
                    HStack{
                        Text("Lean Body Mass")
                        Spacer()
                        Text(String(authViewModel.bodyFat?.leanBodyMass ?? 0) + " %")
                    }
                    HStack{
                        Text("Body Fat (BMI method)")
                        Spacer()
                        Text(String(authViewModel.bodyFat?.bmiMethod ?? 0) + " %")
                    }
                }
            }.navigationTitle("Body Fat")
        }
    }
}

#Preview {
    BodyFatView()
}
