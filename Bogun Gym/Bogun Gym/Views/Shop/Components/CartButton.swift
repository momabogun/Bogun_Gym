//
//  CartButton.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct CartButton: View {
    @ObservedObject var storeViewModel: StoreViewModel
    
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Text("Shopping cart")
                
                if !storeViewModel.cartSupplements.isEmpty {
                    Text("•")
                    
                    Text("\(storeViewModel.calculateItemCount())")
                }
            }
            .frame(maxWidth: .infinity)
            .font(.headline)
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
        }
    }
}

#Preview {
    CartButton(storeViewModel: .init(), action: {})
}
