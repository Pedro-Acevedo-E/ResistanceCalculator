//
//  Resistance.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 27/05/24.
//

import Foundation
import SwiftUI

extension ResistanceView {
    @Observable
    class ResistanceViewModel {
        var multiplier = BandColor(colors: bandColors, color: .brown)
        var color1 = BandColor(colors: bandColors, color: .black)
        var color2 = BandColor(colors: bandColors, color: .red)
        var color3 = BandColor(colors: bandColors, color: .red)
        var toleranceColor = BandColor(colors: toleranceColors, color: silverColor)
        var ppmColor = BandColor(colors: ppmColors, color: .red)
        
        let formatter = NumberFormatter()
        
        var fourBandValue: String {
            let value = Double((color2.colorValue * 10) + color1.colorValue) * multiplier.multiplierValue
            let formattedString = formatter.string(from: NSNumber(value: value))!
            
            return formattedString + " " + multiplier.multiplierMagnitude
        }
        
        var fiveBandValue: String {
            let value = Double(
                (color3.colorValue * 100) + (color2.colorValue * 10) + color1.colorValue
            ) * multiplier.multiplierValue
            let formattedString = formatter.string(from: NSNumber(value: value))!
            return formattedString + " " + multiplier.multiplierMagnitude
        }
        
        init() {
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
        }
    }
}
