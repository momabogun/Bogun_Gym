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
    @Binding var path: NavigationPath
    var body: some View {
        NavigationStack(path: $path){
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
            VStack{
                
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100)),
                        GridItem(.flexible(minimum: 100))
                    ], spacing: 10) {
                        ForEach(storeViewModel.supplements) { supplement in
                            ItemView(supplement: supplement)
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
            }
            .navigationDestination(for: Supplement.self){
                DetailShopView(supplement: $0)
            }
            .navigationTitle("Supplement Shop")
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
    private func showCart() {
        shouldShowCart.toggle()
    }
    private func showSheet(){
        isPresented.toggle()
    }
}


