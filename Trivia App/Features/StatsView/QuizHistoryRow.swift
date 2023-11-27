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
            .padding(.trailing, 10)
            
            Text("You got **\(numCorrects)** out of **\(numQuestions)**")
                .fontWeight(.light)
                .font(.title3)
                .frame(maxWidth: 200)
            
            Spacer()
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        QuizHistoryRow(
            numCorrects: 10,
            numQuestions: 10
        )
        QuizHistoryRow(
            numCorrects: 7,
            numQuestions: 10
        )
        QuizHistoryRow(
            numCorrects: 1,
            numQuestions: 10
        )
        
        QuizHistoryRow(
            numCorrects: 4,
            numQuestions: 10
        )
    }
}
