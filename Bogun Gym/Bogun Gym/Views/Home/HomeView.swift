//
//  HomeView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 18.01.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel :AuthViewModel
    
    @State var search = ""
    let columns = [
        GridItem(.adaptive(minimum: 150))
        ]
    var body: some View {
        NavigationStack{
            ScrollView {
            VStack{
                AdsView()
                
                    LazyVGrid(columns: columns, spacing: 20) {
                        BodyPartListView()
                    }.padding(5)
                }.toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                }
                
                
            }
                            
        }        }
    }


#Preview {
    HomeView()
}
