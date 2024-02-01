//
//  ItemView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct ItemView: View {
    let supplement: Supplement
    @EnvironmentObject var storeViewModel: StoreViewModel
    @State var quantity: Int16 = 1
    var body: some View {
            
            VStack(spacing: 15){
                NavigationLink(value: supplement){
                    Image(supplement.image!)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 150)
                        
                }
                    
                    
                    Text(supplement.name!.prefix(11) + (supplement.name!.count > 11 ? "..." : ""))
                        .font(.footnote)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color.accentColor)
                        .cornerRadius(25)
                
                if storeViewModel.containsItem(supplement){
                    RemoveFromCartButton(action: removeFromCart)
                } else{
                    AddToCartButton(supplement: supplement, quantity: $quantity, action: addToCart)
                }
                
                
            }.padding(.top,10)
                .padding([.horizontal,.bottom],20)
                .background(.white)
                .cornerRadius(25.0)
                .shadow(radius: 3)
                
        
            
    }
    
    
    private func addToCart() {
        withAnimation {
            storeViewModel.upgradeQuantity(supplement, newQuantity: quantity)
            storeViewModel.addToCart(supplement)
            quantity = 1
        }
    }
    
    private func removeFromCart() {
        withAnimation {
            quantity = 1
            storeViewModel.removeFromCart(supplement)
            
        }
    }
}
