//
//  QuestionLocalService.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

protocol QuestionsLocalService {
    func getStreak() -> Int
    func save(streak: Int)
    func getQuizHistory() throws -> [Int]
    func saveQuizHistory(quizHistory: [Int]) throws
}
