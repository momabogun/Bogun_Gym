//
//  AuthView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var firebaseUserViewModel:AuthViewModel
    @State private var mode: AuthMode = .login
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    var body: some View {
        VStack{
            Text("To use this feature, first you must Login or create new account")
                .font(.title)
                .bold()
            VStack(spacing: 48) {
                
                VStack(spacing: 12) {
                    ZStack(alignment: .bottom) {
                        TextField("Username", text: $name)
                            .frame(minHeight: 36)
                        
                        Divider()
                    }
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
        email.isEmpty || password.isEmpty || name.isEmpty
    }
    
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    
    private func authenticate() {
        switch mode {
        case .login:
            firebaseUserViewModel.login(email: email, password: password)
        case .register:
            firebaseUserViewModel.register(email: email, password: password, name: name)
        }
    }
}


