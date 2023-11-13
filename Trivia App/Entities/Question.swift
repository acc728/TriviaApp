//
//  Question.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

struct Question: Codable {
    let category: String
    let type: TypeEnum
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case multiple = "multiple"
}
