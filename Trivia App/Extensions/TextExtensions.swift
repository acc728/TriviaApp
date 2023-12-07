//
//  TextExtensions.swift
//  Trivia App
//
//  Created by user242582 on 7/12/23.
//

import SwiftUI

extension Text {
    func makeGridRow() {
        self
            .padding()
            .background( LinearGradient(
                gradient: Gradient(colors: Gradients.blueGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
