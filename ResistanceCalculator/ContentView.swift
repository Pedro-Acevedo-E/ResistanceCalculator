//
//  ContentView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 23/05/24.
//

import SwiftUI

let goldColor = Color(.gold)
let silverColor = Color(.silver)

struct ContentView: View {
    let colors: [Color] = [.black, .brown, .red, .orange, .yellow, .green, .blue, .purple, .gray, .white]
    let toleranceColors: [Color] = [goldColor, silverColor]
    @State private var firstBandColor = Color.red
    @State private var secondBandColor = Color.red
    @State private var thirdBandColor = Color.brown
    @State private var toleranceBandColor = goldColor
    
    var body: some View {
        ZStack {
            Image("ResistorBase")
                .resizable()
                .scaledToFit()
            HStack {
                ColorPickerView(
                    colors: colors,
                    selectedColor: $firstBandColor
                )
                ColorPickerView(
                    colors: colors,
                    selectedColor: $secondBandColor
                )
                ColorPickerView(
                    colors: colors,
                    selectedColor: $thirdBandColor
                )
                ColorPickerView(
                    colors: toleranceColors,
                    selectedColor: $toleranceBandColor
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
