//
//  QuestionsRepository.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

struct QuestionsRepository {
    private let remoteService: QuestionsRemoteService
    //TODO: private let localService: QuestionsLocalService
    
    init(remoteService: QuestionsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getQuestion() async throws -> Question {
        return try await remoteService.getQuestion()
    }
    
    func getQuiz() async throws -> [Question] {
        return try await remoteService.getQuiz()
    }
}
