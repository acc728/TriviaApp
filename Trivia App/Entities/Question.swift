//
//  Question.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

struct Question: Codable, Identifiable {
    var id = UUID()
    let category: String
    let type: String
    let difficulty: String
    let question, correctAnswer: String
    let incorrectAnswers: [String]
    
    var answers: [String] {
        var allAnswers = incorrectAnswers
        allAnswers.append(correctAnswer)
        return allAnswers.shuffled()
    }

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    static var example: Question {
        .init(
            category: "Science: Mathematics",
            type: "multiple",
            difficulty: "medium",
            question: "What is the first Mersenne prime exponent over 1000?",
            correctAnswer: "1279",
            incorrectAnswers: [
                "2203",
                "1009",
                "1069"
           ])
    }
}
