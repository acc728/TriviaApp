//
//  ProgressBar.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        Gauge(value: progress, label: {})
            .tint(
                LinearGradient(
                    gradient: Gradient(colors: Gradients.blueGradient),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
    }
}

#Preview {
    ProgressBar(progress: 0.7)
}
