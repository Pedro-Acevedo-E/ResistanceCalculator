//
//  ColorPickerView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 23/05/24.
//

import SwiftUI

struct ColorPickerView: View {
    let colors: [Color]
    @Binding var selectedColor: Color
    @State var showPicker: Bool = false
    @Binding var screenSize: CGRect
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(selectedColor)
                .frame(width: screenSize.width / stripWidth, height: screenSize.width / stripHeight)
                .onTapGesture {
                    withAnimation(.spring(duration: springDuration, bounce: springBounces)) {
                        showPicker.toggle()
                    }
                }
            if showPicker {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: screenSize.height / gridMinimumWidth))])  {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(
                                width: screenSize.height < screenSize.width ?
                                    screenSize.height / colorCellWidth :
                                    screenSize.width / colorCellWidth,
                                height: screenSize.height < screenSize.width ?
                                    screenSize.height / colorCellHeight :
                                    screenSize.width / colorCellHeight
                            )
                            .border(.white, width: borderWidth)
                            .onTapGesture {
                                withAnimation() {
                                    selectedColor = color
                                    showPicker.toggle()
                                }
                            }
                    }
                }
                .frame(maxWidth: screenSize.width / 10)
                .transition(.scale)
            }
        }
    }
}

#Preview {
    ColorPickerView(
        colors: [.red, .blue, .orange],
        selectedColor: .constant(.red),
        screenSize: .constant(CGRect(x: 0, y: 0, width: 100, height: 100))
    )
}
