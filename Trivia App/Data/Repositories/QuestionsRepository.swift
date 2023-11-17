//
//  QuestionsRepository.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

struct QuestionsRepository {
    private let remoteService: QuestionsRemoteService
    private let localService: QuestionsLocalService
    
    init(remoteService: QuestionsRemoteService, localService: QuestionsLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getQuestion() async throws -> Question {
        return try await remoteService.getQuestion()
    }
    
    func getQuiz() async throws -> [Question] {
        return try await remoteService.getQuiz()
    }
    
    func getStreak() -> Int {
        return localService.getStreak()
    }
    
    func saveStreak(streak: Int) {
        localService.save(streak: streak)
    }
    
    func getQuizHistory() -> [Int] {
        do {
            return try localService.getQuizHistory()
        } catch {
            return []
        }
    }
    
    func saveQuizHistory(quizHistory: [Int]) throws {
        try localService.saveQuizHistory(quizHistory: quizHistory)
    }
}
