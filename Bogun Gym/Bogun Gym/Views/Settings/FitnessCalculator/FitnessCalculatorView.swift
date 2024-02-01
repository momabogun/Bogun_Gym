//
//  FitnessCalculatorView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct FitnessCalculatorView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        
            Group {
                if authViewModel.user?.age == nil{
                   BodyParametersView()
                        .environmentObject(authViewModel)
                } else{
                    FitnessCalListView()
                        .environmentObject(authViewModel)
                }
            }

    }
}

#Preview {
    FitnessCalculatorView()
}
