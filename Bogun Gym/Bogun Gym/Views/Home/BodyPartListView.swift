//
//  BodyPartListView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import SwiftUI

struct BodyPartListView: View {
    @StateObject var bodyViewModel = BodyPartViewModel()
    var body: some View {
        ForEach(bodyViewModel.bodyParts) { part in
            NavigationLink(destination: ExerciseListView(bodyPart: part)){
                
                VStack(alignment: .leading){
                    Image(part.image ?? "")
                        .resizable()
                        .scaledToFill() .frame(width: 180, height: 200)
                        .background(.gray)
                        .cornerRadius(25.0)
                    Text(part.title?.capitalized ?? "")
                        .font(.title3)
                        .bold()
                        .padding(10)
                    
                    
                }.background{
                    Color.accent.opacity(0.4)
                        .cornerRadius(25.0)
                }
                
            }
        }
    }
}


