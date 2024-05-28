//
//  ResistorBaseView.swift
//  ResistanceCalculator
//
//  Created by Pedro Acevedo on 28/05/24.
//

import SwiftUI

struct ResistorBaseView: View {
    var body: some View {
        VStack {
            Image("ResistorBase")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ResistorBaseView()
}
