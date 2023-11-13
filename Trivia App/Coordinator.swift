//
//  Coordinator.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    private let questionsRepository: QuestionsRepository
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()

        let questionsRemoteService: QuestionsRemoteService = mock ? MockQuestionsRemoteService() : LiveQuestionsRemoteService(networkClient: networkClient)
        questionsRepository = QuestionsRepository(remoteService: questionsRemoteService)
    }
    
    // MARK: - EpisodesView
    func makeQuestionView() -> QuestionView {
        QuestionView(viewModel: makeQuestionViewModel())
    }
    
    // MARK: - EpisodesView
    func makeQuestionViewModel() -> QuestionViewViewModel {
        .init(questionRepository: questionsRepository)
    }
    
    
    
}
