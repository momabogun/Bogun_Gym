//
//  ExerciseView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: ExerciseEntity
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: exercise.gifUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    
            } placeholder: {
                Image(systemName: "dumbbell.fill")
            }.frame(width: 50, height: 50)
                .cornerRadius(10)
            
            Text(exercise.name?.capitalized ?? "").font(.headline)
            Spacer()
                    
            
            
        }.padding()
            .background(.accent.opacity(0.4))
            .cornerRadius(25)
    }
}

