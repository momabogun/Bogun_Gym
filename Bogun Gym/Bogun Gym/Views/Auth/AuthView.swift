//
//  AuthView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var firebaseUserViewModel:FirebaseUserViewModel
    @State private var mode: AuthMode = .login
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            VStack(spacing: 48) {
                Text("To use this feature, first you must Login")
                VStack(spacing: 12) {
                    ZStack(alignment: .bottom) {
                        TextField("E-Mail", text: $email)
                            .frame(minHeight: 36)
                        
                        Divider()
                    }
                    
                    ZStack(alignment: .bottom) {
                        SecureField("Passwort", text: $password)
                            .frame(minHeight: 36)
                        
                        Divider()
                    }
                }
                .font(.headline)
                .textInputAutocapitalization(.never)
                
                PrimaryButton(title: mode.title, action: authenticate)
                    .disabled(disableAuthentication)
                
                TextButton(title: mode.alternativeTitle, action: switchAuthenticationMode)
            }.padding(48).background{
                Color.gray.opacity(0.2)
                    .cornerRadius(25)
            }
            Spacer()
        }
    
    }
    
    private var disableAuthentication: Bool {
        email.isEmpty || password.isEmpty
    }
    
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    
    private func authenticate() {
        switch mode {
        case .login:
            firebaseUserViewModel.login(email: email, password: password)
        case .register:
            firebaseUserViewModel.register(email: email, password: password)
        }
    }
}


