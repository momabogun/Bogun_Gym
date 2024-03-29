//
//  TextButton.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct TextButton: View {
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .frame(maxWidth: .infinity)
        }
    }

}

