//
//  UserDefaultsQuestionsLocalService.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import Foundation

struct UserDefaultsQuestionsLocalService: QuestionsLocalService {
    private let streakKey = "streak"
    
    func getStreak() -> Int {
        return UserDefaults.standard.integer(forKey: streakKey)
    }
    
    func save(streak: Int) {
        UserDefaults.standard.set(streak, forKey: streakKey)
    }
}
