//
//  CartItemView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct CartItemView: View {
    let supplement: Supplement
    var body: some View {
        HStack(spacing: 10) {
            Image(supplement.image ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            
            Text(supplement.name ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(supplement.quantity) x")
            Text(supplement.price, format: .currency(code: "EUR"))
        }
        .font(.headline)
    }
}


