//
//  SplashScreenView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 23.01.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var opacity = 1.0
    @Binding var isPresented: Bool
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @StateObject var exercisesViewModel = ExercisesViewModel()
    var body: some View {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
        }
        .scaleEffect(scale)
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = CGSize(width: 1, height: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                exercisesViewModel.fetchExercises()
                withAnimation(.easeIn(duration: 0.35)){
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                    isPresented.toggle()
                }
                
            })
        }
    }
}




