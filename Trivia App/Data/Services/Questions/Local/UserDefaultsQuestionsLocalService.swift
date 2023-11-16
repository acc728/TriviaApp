//
//  UserDefaultsQuestionsLocalService.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import Foundation

struct UserDefaultsQuestionsLocalService: QuestionLocalService {
    private let streakKey = "streak"
    
    func getStreak() throws -> Int {
        return UserDefaults.standard.integer(forKey: streakKey)
    }
    
    func save(streak: Int) throws {
        UserDefaults.standard.set(streak, forKey: streakKey)
    }
}
