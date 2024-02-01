//
//  IdealWeightView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct IdealWeightView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
            Form{
                Section{
                    HStack{
                        Text("Hamwi")
                        Spacer()
                        Text(String(authViewModel.idealWeight?.hamwi ?? 0) + "kg")
                    }
                    HStack{
                        Text("Devine")
                        Spacer()
                        Text(String(authViewModel.idealWeight?.devine ?? 0) + "kg")
                    }
                    HStack{
                        Text("Miller")
                        Spacer()
                        Text(String(authViewModel.idealWeight?.miller ?? 0) + "kg")
                    }
                    HStack{
                        Text("Robinson")
                        Spacer()
                        Text(String(authViewModel.idealWeight?.robinson ?? 0) + "kg")
                    }
                }.navigationTitle("Ideal Weight")
        }
    }
}

#Preview {
    IdealWeightView()
}
