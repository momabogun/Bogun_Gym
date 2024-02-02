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
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var wrongPassword = false
    @State private var accountCreated = false
    @State private var authErrorApeared = false
    @State private var authError: String?
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding()
            VStack(spacing: 48) {
                
                VStack(spacing: 12) {
                    ZStack(alignment: .bottom){
                        Text(mode.title)
                            .font(.title)
                            .bold()
                    }
                    ZStack(alignment: .bottom) {
                        if mode != .login{
                            TextField("Username", text: $name)
                                .frame(minHeight: 45)
                                .textFieldStyle(.roundedBorder)
                            
                            
                        }
                    }
                    ZStack(alignment: .bottom) {
                        TextField("E-Mail", text: $email)
                            .frame(minHeight: 45)
                            .textFieldStyle(.roundedBorder)
                        
                        
                    }
                    
                    ZStack(alignment: .bottom) {
                        SecureField("Password", text: $password)
                            .frame(minHeight: 45)
                            .textFieldStyle(.roundedBorder)
                        
                        
                    }
                    ZStack(alignment: .bottom) {
                        if mode != .login{
                            SecureField("Confirm Password", text: $confirmPassword)
                                .frame(minHeight: 45)
                                .textFieldStyle(.roundedBorder)
                            
                            
                        }
                    }
                }
                .font(.headline)
                .textInputAutocapitalization(.never)
                
                PrimaryButton(title: mode.title){
                    authenticate()
                }
                    .disabled(disableAuthentication)
                
                TextButton(title: mode.alternativeTitle, action: switchAuthenticationMode)
            }.padding(48).background{
                Color.gray.opacity(0.2)
                    .cornerRadius(25)
            }
            
            
                
                Text("Please login or register account to use all the features.")
                    .font(.subheadline)
                    .padding(.vertical,40)
                
            
                
           
        }
        .alert("Account successfully created!", isPresented: $accountCreated){
            Button("Ok"){
                accountCreated.toggle()
            }
        }.alert("Your passwords dont match!", isPresented: $wrongPassword){
            Button("Ok"){
                wrongPassword.toggle()
                password = ""
                confirmPassword = ""
            }
        }
        
        .alert("Your passwords dont match!", isPresented: $wrongPassword){
            Button("Ok"){
                wrongPassword.toggle()
                password = ""
                confirmPassword = ""
            }
        }
        
        .alert(authError ?? "", isPresented: $authErrorApeared){
            Button("Ok"){
                authErrorApeared.toggle()
            }
        }
        
       
    
    }
    
    private var disableAuthentication: Bool {
        if mode == .register{
            email.isEmpty || password.isEmpty || name.isEmpty || confirmPassword.isEmpty
        } else{
            email.isEmpty || password.isEmpty
        }
    }
    
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    
    private func authenticate() {
        switch mode {
        case .login:
            firebaseUserViewModel.login(email: email, password: password){ error in
                if let error = error {
                    authError = error.localizedDescription
                    authErrorApeared = true
                }
                
            }
        case .register:
            if password == confirmPassword{
                firebaseUserViewModel.register(email: email, password: password, name: name){ error in
                    if let error = error {
                        authError = error.localizedDescription
                        authErrorApeared = true
                    }else{
                        accountCreated = true
                    }
                }
            } else{
                wrongPassword = true
            }
        }
    }
}

#Preview {
    AuthView(firebaseUserViewModel: .init())
}


