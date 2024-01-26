//
//  CartView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var storeViewModel: StoreViewModel
    @Binding var cartShow: Bool
    @State var isShown: Bool = false
    @State var congrats: Bool = false
    var body: some View {
        NavigationStack {
            Group {
                if storeViewModel.cartSupplements.isEmpty {
                    placeholder
                } else {
                    list
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Would you like to proceed with your purchase?", isPresented: $isShown) {
                Button("Yes"){
                    congrats.toggle()
                    storeViewModel.createPurchase()
                    storeViewModel.setAllSupplementsQuantity()
                    storeViewModel.removeAll()
                }
                Button("No"){
                    isShown.toggle()
                }
            }
            .alert("Thanks for your purchase! We appreciate your support. Enjoy using our app! 😊📱", isPresented: $congrats){
                Button("Ok"){
                    congrats.toggle()
                    cartShow.toggle()
                }
            }
        }
    }
    
    private var placeholder: some View {
        VStack(spacing: 15) {
            Image(systemName: "cart.circle")
                .font(.largeTitle)
            
            Text("Your shopping cart is empty")
                .font(.body)
        }
    }
    
    private var list: some View {
        VStack{
            List(storeViewModel.cartSupplements) { supplement in
                CartItemView(supplement: supplement)
                    .swipeActions {
                        Button(role: .destructive) {
                            storeViewModel.removeFromCart(supplement)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
            
            HStack(spacing: 20){
                Spacer()
                Text("Item total:")
                Text(storeViewModel.calculateTotal(), format: .currency(code: "EUR"))
                Button("Checkout(\(storeViewModel.calculateItemCount()))"){
                    isShown.toggle()
                }.buttonStyle(.bordered)
                
                
            }.padding()
        }
    }

}


