//
//  UserDefaultsQuestionsLocalService.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import Foundation

struct UserDefaultsQuestionsLocalService: QuestionsLocalService {
    private let streakKey = "streak"
    private let quizHistoryKey = "quizHistory"
    
    func getStreak() -> Int {
        return UserDefaults.standard.integer(forKey: streakKey)
    }
    
    func save(streak: Int) {
        UserDefaults.standard.set(streak, forKey: streakKey)
    }
    
    func getQuizHistory() throws -> [Int] {
        guard let quizHistoryData = UserDefaults.standard.data(forKey: quizHistoryKey) else {
            return []
        }
        return try JSONDecoder().decode([Int].self, from: quizHistoryData)
    }
    
    func saveQuizHistory(quizHistory: [Int]) throws {
        let data = try JSONEncoder().encode(quizHistory)
        UserDefaults.standard.set(data, forKey: quizHistoryKey)
    }

}
