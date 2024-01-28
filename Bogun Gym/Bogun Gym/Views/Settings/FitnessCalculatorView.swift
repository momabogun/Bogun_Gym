//
//  FitnessCalculatorView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct FitnessCalculatorView: View {
    var body: some View {
        Form{
            Section{
                
                NavigationLink {
                    
                } label: {
                    Text("Daily calory requirements")
                }
                NavigationLink {
                    
                } label: {
                    Text("BMI")
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Body Fat Percentage")
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Ideal weight")
                }

            }
        }
    }
}

#Preview {
    FitnessCalculatorView()
}
