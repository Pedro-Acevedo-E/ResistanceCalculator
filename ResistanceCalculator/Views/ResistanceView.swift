//
//  ResistanceView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 28/05/24.
//

import SwiftUI

struct ResistanceView: View {
    @State private var resistance = ResistanceViewModel()
    @Binding var screenSize: CGRect
    @State private var selectedBand = "4 Bands"
    
    var body: some View {
        VStack {
            ZStack {
                ResistorBaseView()
                HStack {
                    if (selectedBand != "4 Bands") {
                        ColorPickerView(
                            colors: resistance.color3.colors,
                            selectedColor: $resistance.color3.color,
                            screenSize: $screenSize
                        )
                        .padding(.trailing, screenSize.width / colorStripSeparation)
                        .transition(.scale)
                    }
                    
                    ColorPickerView(
                        colors: resistance.color2.colors,
                        selectedColor: $resistance.color2.color,
                        screenSize: $screenSize
                    )
                    .padding(.trailing, screenSize.width / colorStripSeparation)
                    
                    ColorPickerView(
                        colors: resistance.color1.colors,
                        selectedColor: $resistance.color1.color,
                        screenSize: $screenSize
                    )
                    .padding(.trailing, screenSize.width / colorStripSeparation)
                    
                    ColorPickerView(
                        colors: resistance.multiplier.colors,
                        selectedColor: $resistance.multiplier.color,
                        screenSize: $screenSize
                    )
                    .padding(.trailing, screenSize.width / toleranceStripSeparation)
                    
                    ColorPickerView(
                        colors: resistance.toleranceColor.colors,
                        selectedColor: $resistance.toleranceColor.color,
                        screenSize: $screenSize
                    )
                    .padding(.trailing, screenSize.width / colorStripSeparation)
    
                    if (selectedBand == "6 Bands") {
                        ColorPickerView(
                            colors: resistance.ppmColor.colors,
                            selectedColor: $resistance.ppmColor.color,
                            screenSize: $screenSize
                        )
                        .transition(.scale)
                    }
                }
            }
            
            Text(selectedBand == "4 Bands"
                 ? resistance.fourBandValue
                 : resistance.fiveBandValue
            )
            .font(.system(size: screenSize.height > screenSize.width
                          ? screenSize.width / fontScale : screenSize.height / fontScale))
            .bold()
            
            Text(resistance.toleranceColor.tolerance +
                 (selectedBand == "6 Bands" ? " " + resistance.ppmColor.ppmValue : ""))
            .font(.system(size: screenSize.height > screenSize.width
                          ? screenSize.width / fontScale : screenSize.height / fontScale))
            
            ResistancePickerView(selectedBand: $selectedBand, screenSize: $screenSize)
        }
        .animation(.default, value: selectedBand)
    }
}

#Preview {
    ResistanceView(
        screenSize: .constant(CGRect(x: 0, y: 0, width: 100, height: 100))
    )
}
