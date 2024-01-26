//
//  ContainerView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 23.01.24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    var body: some View {
        if !isSplashScreenViewPresented {
            NavigatorView()
                .preferredColorScheme(.dark)
        } else {
            SplashScreenView(isPresented: $isSplashScreenViewPresented)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContainerView()
}

