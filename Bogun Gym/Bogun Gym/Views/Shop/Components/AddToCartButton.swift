//
//  AddToCartButton.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct AddToCartButton: View {
    
    let supplement: Supplement
    @Binding var quantity: Int16
    let action: () -> Void
    @EnvironmentObject private var storeViewModel: StoreViewModel
    
    var body: some View {
        
        HStack{
            Stepper("Qty: \(quantity)", value: $quantity, in: 1...Int16.max)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        
        }
        
        Button(action: action){
            HStack(spacing: 5) {
                Image(systemName: "cart.fill")
                Text(supplement.price , format: .currency(code: "EUR"))
            }
            .font(.footnote)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(Capsule())
        }
    }
    }


