//
//  RowAnswer.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct RowAnswer: View {
    var answer: Answer
    @State private var isSelected = false
    
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
        .foregroundColor(isSelected ? .blue : .gray)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 1, y: 1)
        .onTapGesture {
            isSelected = true
        }
    }
}

#Preview {
    RowAnswer(answer: .example)
}
