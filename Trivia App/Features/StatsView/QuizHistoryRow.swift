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
    let index: Int
    
    init(numCorrects: Int, numQuestions: Int = 10, index: Int) {
        self.numCorrects = numCorrects
        self.numQuestions = numQuestions
        self.index = index
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Spacer()
            
            Text("#\(index)")
                .padding(.trailing, 5)
                        
            CircularProgressView(
                progress: Double(numCorrects) / Double(numQuestions),
                color: .blue,
                gradient: Gradients.blueGradient,
                lineWidth: 15
            )
            .frame(width: 70)
            
            Text("You got **\(numCorrects)** out of **\(numQuestions)**")
                .fontWeight(.light)
                .font(.title3)
                .frame(maxWidth: 225)
            
            Spacer()
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        QuizHistoryRow(
            numCorrects: 10,
            numQuestions: 10,
            index: 0
        )
        QuizHistoryRow(
            numCorrects: 7,
            numQuestions: 10,
            index: 1
        )
        QuizHistoryRow(
            numCorrects: 1,
            numQuestions: 10,
            index: 2
        )
        
        QuizHistoryRow(
            numCorrects: 4,
            numQuestions: 10,
            index: 3
        )
    }
}
