//
//  ContentView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 23/05/24.
//

import SwiftUI

struct ContentView: View {
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
            
            ResistanceView(
                screenSize: $screenSize
            )
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
