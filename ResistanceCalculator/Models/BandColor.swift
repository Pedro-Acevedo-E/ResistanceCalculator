//
//  BandColor.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 28/05/24.
//

import Foundation
import SwiftUI

class BandColor {
    let colors: [Color]
    var color: Color
    
    init(colors: [Color], color: Color) {
        self.colors = colors
        self.color = color
    }
    
    var tolerance: String {
        switch(color) {
        case .brown:
            return "± 1% Tolerance"
        case .red:
            return "± 2% Tolerance"
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
    
    var colorValue: Int {
        switch (color) {
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
    
    var multiplierValue: Double {
        switch (color) {
        case .brown, .yellow, .purple:
            return 10
        case .red, .green, .gray:
            return 0.1
        default:
            return 1
        }
    }
    
    var multiplierMagnitude: String {
        switch (color) {
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
    
    var ppmValue: String {
        switch (color) {
        case .brown:
            return "100 ppm/°C"
        case .red:
            return "50 ppm/°C"
        case .orange:
            return "15 ppm/°C"
        case .yellow:
            return "25 ppm/°C"
        case .blue:
            return "10 ppm/°C"
        case .purple:
            return "5 ppm/°C"
        default:
            return ""
        }
    }
}
