//
//  RowAnswer.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct QuizRowAnswer: View {
    var answer: Answer
    @State private var isSelected = false
    @EnvironmentObject var viewModel: QuizViewViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .foregroundColor(viewModel.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 10, x: 0.5, y: 0.5)
        .onTapGesture {
            if !viewModel.answerSelected {
                isSelected = true
                viewModel.selectAnswer(answer: answer)
            }
        }
    }
}

#Preview {
    QuizRowAnswer(answer: .example)
        .environmentObject(Coordinator().makeQuizViewModel())
}
