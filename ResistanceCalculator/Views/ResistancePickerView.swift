//
//  resistancePicker.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 28/05/24.
//

import SwiftUI

struct ResistancePickerView: View {
    @Binding var selectedBand: String
    @Binding var screenSize: CGRect
    
    var body: some View {
        HStack {
            ForEach(bandStrips, id: \.self) { band in
                ZStack {
                    Rectangle()
                        .foregroundColor(band == selectedBand ? .black.opacity(0.3) : .gray.opacity(0.3))
                        .frame(maxHeight: screenSize.height > screenSize.width ?
                               screenSize.height / pickerScale : screenSize.width / pickerScale
                        )
                        .clipShape(.capsule)
                    Text(band)
                        .font(.system(
                            size: screenSize.height > screenSize.width
                            ? screenSize.width / pickerScale : screenSize.height / pickerScale))
                }
                .onTapGesture {
                    withAnimation {
                        selectedBand = band
                    }
                }
            }
        }.padding(.horizontal)
    }
}

#Preview {
    ResistancePickerView(
        selectedBand: .constant("4 Bands"),
        screenSize: .constant(CGRect(x: 0, y: 0, width: 100, height: 100))
    )
}
