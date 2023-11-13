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
            .tint(Color("AccentColor"))

    }
}

#Preview {
    ProgressBar(progress: 0.7)
}
