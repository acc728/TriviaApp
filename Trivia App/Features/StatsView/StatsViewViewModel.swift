//
//  StatsViewViewModel.swift
//  Trivia App
//
//  Created by user242582 on 17/11/23.
//

import Foundation

class StatsViewViewModel: ObservableObject {
    private let repository: QuestionsRepository
    @Published private(set) var streak: Int = 0
    @Published private(set) var quizHistory: [Int] = []
    
    init(repository: QuestionsRepository) {
        self.repository = repository
    }
    
    func getStreak() {
        streak = repository.getStreak()
    }
    
    func getQuizHistory() {
        quizHistory = repository.getQuizHistory()
    }
    
}
