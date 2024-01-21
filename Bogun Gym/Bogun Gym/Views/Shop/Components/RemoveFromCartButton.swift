//
//  RemoveFromCartButton.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct RemoveFromCartButton: View {
    let action: () -> Void
    var body: some View {VStack{
        Spacer()
        Button(action: action) {
            
                Image(systemName: "trash")
                    .font(.headline)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .background(.red)
                    .clipShape(Capsule())
            
        }
    }
    }
}

#Preview {
    RemoveFromCartButton(action: {})
}
