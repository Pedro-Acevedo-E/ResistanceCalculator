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
    @State private var toleranceBandColor = silverColor
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Image("ResistorBase2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
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
                        .padding(.trailing, 20)
                        ColorPickerView(
                            colors: toleranceColors,
                            selectedColor: $toleranceBandColor
                        )
                    }
                }
                Text("150 kΩ")
                    .font(.title2)
                    .bold()
                Text("5% Tolerance")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
