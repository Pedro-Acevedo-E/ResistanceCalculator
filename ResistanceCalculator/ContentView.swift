//
//  ContentView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .yellow]
      @State private var selectedColor = Color.red
      @State private var showColorPicker = false
    
    var body: some View {
      VStack {
        ColorPickerView(colors: colors, selectedColor: $selectedColor, showPicker: $showColorPicker)
      }
    }
}

struct ColorPickerView: View {
  let colors: [Color]
  @Binding var selectedColor: Color
  @Binding var showPicker: Bool

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
        .transition(.scale)
      }
    }
  }
}

#Preview {
    ContentView()
}
