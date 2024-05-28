//
//  Constants.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 27/05/24.
//

import Foundation
import SwiftUI

let goldColor = Color(.gold)
let silverColor = Color(.silver)
let noColor: Color = .white.opacity(0.1)
let bandColors: [Color] = [.black, .brown, .red, .orange, .yellow, .green, .blue, .purple, .gray, .white]
let toleranceColors: [Color] = [noColor, goldColor, silverColor, .brown, .red]
let ppmColors: [Color] = [.brown, .red, .orange, .yellow, .blue, .purple]

let springDuration = 1.0
let springBounces = 0.5

let bandStrips = ["4 Bands", "5 Bands", "6 Bands"]

//Controls the scale for text, higher value means smaller text
let fontScale = 20.0

//Controls the scale (height) for segmented picker, higher value means smaller picker
let pickerScale = 30.0

//Control the minimum grid item width for color cells, higher value means more cells
let gridMinimumWidth = 15.0

//Controls Scale for the separation of the first 3 strips a higher value means strips are closer together
let colorStripSeparation: CGFloat = 60

//Controls Scale for the separation between the first 3 strips and the tolerance strip a higher value means strips are closer together
let toleranceStripSeparation: CGFloat = 13

//Controls Scale for the width of the color strips a higher value means strips are smaller
let stripWidth: CGFloat = 20

//Controls Scale for the height of the color strips a higher value means strips are smaller
let stripHeight: CGFloat = 5.18

//Controls Scale for the height of each color cell (For color change selection) a higher value means cells are smaller
let colorCellHeight: CGFloat = 15

//Controls Scale for the width of each color cell (For color change selection) a higher value means cells are smaller
let colorCellWidth: CGFloat = 15

//Controls the thickness of the borders around each cell a higher value means larger thickness
let borderWidth: CGFloat = 1
