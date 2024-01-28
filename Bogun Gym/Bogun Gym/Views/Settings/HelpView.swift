//
//  HelpView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer(minLength: 100)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(200)
                Spacer(minLength: 100)
                
                Form{
                    Section{
                        Text("Help Center")
                        Text("Contact Us")
                        Text("Terms and Privacy Policy")
                        Text("Licences")
                    }
                }
            }.navigationTitle("Bogun Gym").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HelpView()
}
