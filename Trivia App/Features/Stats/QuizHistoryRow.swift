//
//  QuizHistoryRow.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct QuizHistoryRow: View {
    let numCorrects: Int
    var numQuestions: Int
    
    init(numCorrects: Int, numQuestions: Int = 10) {
        self.numCorrects = numCorrects
        self.numQuestions = numQuestions
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            CircularProgressView(
                progress: Double(numCorrects) / Double(numQuestions),
                color: .blue,
                gradient: Gradients.blueGradient,
                lineWidth: 15
            )
            .frame(width: 70)
            .padding(.trailing)
            
            Text("You got \(numCorrects) out of \(numQuestions)")
                .fontWeight(.light)
                .font(.title3)
            
            Spacer()
        }
    }
}

#Preview {
    QuizHistoryRow(
        numCorrects: 7,
        numQuestions: 10
    )
}
