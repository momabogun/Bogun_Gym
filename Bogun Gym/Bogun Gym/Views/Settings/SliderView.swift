//
//  SliderView.swift
//  Bogun Gym
//
//  Created by Momcilo Bogunovic on 28.01.24.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    let start: Double
    let end: Double
    let string: String
    let messurment: String
    var body: some View {
        HStack{
            Text("\(Int(start))")
            Slider(value: $value, in: start...end)
            Text("\(Int(end))")
        }
        Text(string + ": \(Int(value)) \(messurment)")
    }
}


