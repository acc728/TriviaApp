//
//  LiveQuestionsRemoteService.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

struct LiveQuestionsRemoteService: QuestionsRemoteService {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getQuestion() async throws -> Question {
        //let response: APIResponse<Question> = try await networkClient.get(url: "https://opentdb.com/api.php?amount=1")
        let response: [Question] = try await networkClient.get(url: "https://the-trivia-api.com/api/questions?limit=1")
        //return response.results[0]
        return response[0]
    }
    
    func getQuiz() async throws -> [Question] {
        //let response: APIResponse<Question> = try await networkClient.get(url: "https://opentdb.com/api.php?amount=10")
        return try await networkClient.get(url: "https://the-trivia-api.com/api/questions?limit=10")
        //return response.results
    }
}
