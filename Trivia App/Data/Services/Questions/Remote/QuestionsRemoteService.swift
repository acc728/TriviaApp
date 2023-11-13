//
//  QuestionsRemoteService.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

protocol QuestionsRemoteService {
    func getQuestion() async throws -> Question
}
