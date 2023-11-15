//
//  QuestionRowAnswer.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct QuestionRowAnswer: View {
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var viewModel: QuestionViewViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color("Green") : Color("Red"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background( LinearGradient(
            gradient: Gradient(colors: Gradients.redGradient),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        )
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? Color("Green") : Color("Red")) : .gray, radius: 15, x: 0.5, y: 0.5)
        .onTapGesture {
            if !viewModel.answerSelected {
                isSelected = true
                viewModel.selectAnswer(answer: answer)
            }
        }
    }
}

#Preview {
    QuestionRowAnswer(answer: .example)
        .environmentObject(Coordinator().makeQuestionViewModel())
}
