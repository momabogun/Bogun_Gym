//
//  ShoppingHistory.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct ShoppingHistory: View {
    @EnvironmentObject var storeViewModel: StoreViewModel
    var body: some View {
        NavigationStack{
            VStack{
                List(storeViewModel.bills){ bill in
                    VStack(alignment: .leading){
                        
                        Text("Your payment from:")
                        HStack{
                            Text(formatDate(date: bill.purshaseDate))
                            Spacer()
                            Text(bill.totalPrice, format: .currency(code: "EUR"))
                        }
                        
                    }.padding(5)
                    
                }
            }.navigationTitle("Shoping history").navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d. MMMM yyyy"
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: date)
        }
}

#Preview {
    ShoppingHistory()
}
