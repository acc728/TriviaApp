//
//  MockQuestionsRemoteService.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

struct MockQuestionsRemoteService: QuestionsRemoteService {
    func getQuestion() async throws -> Question {
        .example
    }
    
    func getQuiz() async throws -> [Question] {
        [
            .example,
            .example,
            .example,
            .example,
            .example,
            .example,
            .example,
            .example,
            .example,
            .example
        ]
    }
}
