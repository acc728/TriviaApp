//
//  CircularProgressView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let color: Color
    let gradient: [Color]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.3),
                    lineWidth: 40
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: gradient.reversed()),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing),
                    style: StrokeStyle(
                        lineWidth: 40,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
        .padding()
    }
}

#Preview {
    CircularProgressView(progress: 0.9, color: .pink, gradient: Gradients.redGradient)
}
