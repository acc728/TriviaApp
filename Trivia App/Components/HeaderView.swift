//
//  HeaderView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let message: String
    let gradient: [Color]
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(title)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: gradient),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.top)
            
            HStack {
                Text(message)
                    .font(.title3)
                    .fontWeight(.light)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderView(
        title: "Quiz Trivia App",
        message: "Challenge your knowledge and have fun with different gamemodes!",
        gradient: Gradients.redGradient
    )
}
