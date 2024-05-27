//
//  Resistance.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 27/05/24.
//

import Foundation
import SwiftUI

@Observable
class Resistance {
    let colors: [Color] = [.black, .brown, .red, .orange, .yellow, .green, .blue, .purple, .gray, .white]
    let toleranceColors: [Color] = [goldColor, silverColor, noColor]
    var firstBandColor = Color.red
    var secondBandColor = Color.red
    var thirdBandColor = Color.brown
    var toleranceBandColor = silverColor
    
    var value: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        let value = Double(firstBandValue + secondBandValue) * thirdBandValue
        let formattedString = formatter.string(from: NSNumber(value: value))!
        
        return formattedString + " " + thirdBandMultiplier
    }
    
    var tolerance: String {
        switch(toleranceBandColor) {
        case goldColor:
            return "± 5% Tolerance"
        case silverColor:
            return "± 10% Tolerance"
        case noColor:
            return "± 25% Tolerance"
        default:
            return ""
        }
    }
    
    private var firstBandValue: Int {
        switch (firstBandColor) {
        case .brown:
            return 10
        case .red:
            return 20
        case .orange:
            return 30
        case .yellow:
            return 40
        case .green:
            return 50
        case .blue:
            return 60
        case .purple:
            return 70
        case .gray:
            return 80
        case .white:
            return 90
        default:
            return 0
        }
    }
    
    private var secondBandValue: Int {
        switch (secondBandColor) {
        case .brown:
            return 1
        case .red:
            return 2
        case .orange:
            return 3
        case .yellow:
            return 4
        case .green:
            return 5
        case .blue:
            return 6
        case .purple:
            return 7
        case .gray:
            return 8
        case .white:
            return 9
        default:
            return 0
        }
    }
    
    private var thirdBandValue: Double {
        switch (thirdBandColor) {
        case .brown, .yellow, .purple:
            return 10
        case .red, .green, .gray:
            return 0.1
        default:
            return 1
        }
    }
    
    private var thirdBandMultiplier: String {
        switch (thirdBandColor) {
        case .red, .orange, .yellow:
            return "KΩ"
        case .green, .blue, .purple:
            return "MΩ"
        case .gray, .white:
            return "GΩ"
        default:
            return "Ω"
        }
    }
    
    init() {}
}
