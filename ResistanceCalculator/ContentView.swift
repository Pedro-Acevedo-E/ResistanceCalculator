//
//  ContentView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var resistance = Resistance()
    
    @State var screenSize: CGRect = UIScreen.main.bounds
    @State var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)            .makeConnectable()
        .autoconnect()
    
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
                    VStack {
                        Image("ResistorBase")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                    }
                    HStack {
                        ColorPickerView(
                            colors: resistance.colors,
                            selectedColor: $resistance.firstBandColor,
                            screenSize: $screenSize,
                            orientation: $orientation
                        )
                        .padding(.trailing, screenSize.width / colorStripSeparation)
                        ColorPickerView(
                            colors: resistance.colors,
                            selectedColor: $resistance.secondBandColor,
                            screenSize: $screenSize,
                            orientation: $orientation
                        )
                        .padding(.trailing, screenSize.width / colorStripSeparation)
                        ColorPickerView(
                            colors: resistance.colors,
                            selectedColor: $resistance.thirdBandColor,
                            screenSize: $screenSize,
                            orientation: $orientation
                        )
                        .padding(.trailing, screenSize.width / toleranceStripSeparation)
                        ColorPickerView(
                            colors: resistance.toleranceColors,
                            selectedColor: $resistance.toleranceBandColor,
                            screenSize: $screenSize,
                            orientation: $orientation
                        )
                    }
                }
                Text(resistance.value)
                    .font(.title2)
                    .bold()
                Text(resistance.tolerance)
            }
        }
        .onReceive(orientationChanged) { _ in
            orientation = UIDevice.current.orientation
        }.onChange(of: orientation) {
            screenSize = UIScreen.main.bounds
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
