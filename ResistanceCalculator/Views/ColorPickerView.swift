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

  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(selectedColor)
        .frame(width: 30, height: 100)
        .onTapGesture {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                showPicker.toggle()
            }
        }
      if showPicker {
        LazyVStack() {
          ForEach(colors, id: \.self) { color in
            Rectangle()
              .foregroundColor(color)
              .frame(width: 40, height: 40)
              .onTapGesture {
                  withAnimation() {
                      selectedColor = color
                      showPicker.toggle()
                  }
              }
          }
        }
        .frame(width: 40)
        .transition(.scale)
      }
    }
  }
}

#Preview {
    ColorPickerView(
        colors: [.red, .blue, .orange],
        selectedColor: .constant(.red)
    )
}
