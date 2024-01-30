//
//  ShopView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 19.01.24.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    @StateObject var storeViewModel: StoreViewModel = StoreViewModel()
    @State var shouldShowCart = false
    @State var isPresented = false
    var body: some View {
        NavigationStack{
            Group {
                if authViewModel.userIsLoggenIn{
                    list
                } else{
                    AuthView(firebaseUserViewModel: authViewModel)
                        .padding()
                }
            }
        }
        
        
    }
    
    
    private var list: some View {
        NavigationStack{
            VStack{
                
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100)),
                        GridItem(.flexible(minimum: 100))
                    ], spacing: 10) {
                        ForEach(storeViewModel.supplements) { supplement in
                            ItemView(supplement: supplement, storeViewModel: storeViewModel)
                                .environmentObject(storeViewModel)
                        }
                    }
                    .padding()
                    
                    
                }
                Divider()
                
                CartButton(storeViewModel: storeViewModel, action: showCart)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            }.onAppear{
                storeViewModel.fetchPurchases()
            }.navigationTitle("Supplement Shop")
                .sheet(isPresented: $shouldShowCart, content: {
                    CartView(storeViewModel: storeViewModel, cartShow: $shouldShowCart)
                })
                .sheet(isPresented: $isPresented, content: {
                    ShoppingHistory()
                        .environmentObject(storeViewModel)
                })
                .toolbar{
                    ToolbarItem {
                        Button(action: showSheet){
                            Image(systemName: "doc.fill")
                        }
                    }
                }
                
                
        }
        
            
    }
    private func showCart() {
        shouldShowCart.toggle()
    }
    private func showSheet(){
        isPresented.toggle()
    }
}


