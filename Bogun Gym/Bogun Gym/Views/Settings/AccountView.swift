//
//  SwiftUIView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 26.01.24.
//

import SwiftUI

struct AccountView: View {
    @State private var deleteConfirmation: Bool = false
    var body: some View {
        Form{
            Section{
                Button("Delete my account"){
                    deleteConfirmation.toggle()
                }.foregroundStyle(.red)
            }
        }.alert("Are you sure that you want to delete your account?", isPresented: $deleteConfirmation){
            
            Button("No"){
                deleteConfirmation.toggle()
            }
            Button("Yes"){
                
            }.foregroundStyle(.red)
            
        }
    }
}

#Preview {
    AccountView()
}
