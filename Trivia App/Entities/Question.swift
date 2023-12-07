//
//  Question.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

struct Question: Codable, Identifiable {
    let id: String
    let category: String
    let type: String
    let difficulty: String
    let question, correctAnswer: String
    let incorrectAnswers: [String]
    
    var formattedQuestion: AttributedString {
        do {
            return try AttributedString(markdown: question)
        } catch {
            print("question.formattingErrorMessage".localized() + error.localizedDescription)
            return ""
        }
    }
    
    var answers: [Answer] {
        do {
            let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
            let incorrects = try incorrectAnswers.map { answer in
                Answer(text: try AttributedString(markdown: answer), isCorrect: false)
            }
            return (correct + incorrects).shuffled()
        } catch {
            print("question.answersErrorMessage".localized() + error.localizedDescription)
            return []
        }
    }
    
    static var example: Question {
        .init(
            id: UUID().uuidString,
            category: "General Knowledge",
            type: "multiple",
            difficulty: "easy",
            question: "What is the first Mersenne prime exponent over 1000?",
            correctAnswer: "1279",
            incorrectAnswers: [
                "2203",
                "1009",
                "1069"
           ])
    }
}
