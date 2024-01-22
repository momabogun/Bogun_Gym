//
//  AdsView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 22.01.24.
//

import SwiftUI

struct AdsView: View {
    @State var selectedAd: Ad = .first
    var body: some View {
        TabView(selection: $selectedAd){
            Image(Ad.first.image)
                .resizable()
                .scaledToFill()
                .tag(Ad.first)
            Image(Ad.second.image)
                .resizable()
                .scaledToFill()
                .tag(Ad.second)
            Image(Ad.third.image)
                .resizable()
                .scaledToFill()
                .tag(Ad.third)
            Image(Ad.fourth.image)
                .resizable()
                .scaledToFill()
                .tag(Ad.fourth)
            
        }.tabViewStyle(.page)
            .frame(height: 300)
    }
}

#Preview {
    AdsView()
}
