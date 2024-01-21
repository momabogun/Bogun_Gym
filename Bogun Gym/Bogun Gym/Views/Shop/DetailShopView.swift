//
//  DetailShopView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 20.01.24.
//

import SwiftUI

struct DetailShopView: View {
    let supplement: Supplement
        var body: some View {
                    VStack(spacing: 15){
            
                            Image(supplement.image!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 200)
                            
                            Spacer()
                            Text(supplement.name!)
                                .font(.headline)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(Color.accentColor)
                                .cornerRadius(25)
                      
                       
                        
                    }.padding(.top,10)
                        .padding([.horizontal,.bottom],20)
                
            }
        
      

}

