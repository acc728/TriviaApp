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
    
    // MARK: - ModeSelectorView
    func makeModeSelectorView() -> ModeSelectorView {
        ModeSelectorView(quizViewModel: makeQuizViewModel(), questionViewModel: makeQuestionViewModel())
    }
    
    
    
    // MARK: - QuestionDetailView
    func makeQuestionView() -> QuestionView {
        QuestionView()
    }
    
    // MARK: - QuestionDetailView
    func makeQuestionDetailView() -> QuestionDetailView {
        QuestionDetailView()
    }
    
    // MARK: - QuestionViewViewModel
    func makeQuestionViewModel() -> QuestionViewViewModel {
        .init(questionRepository: questionsRepository)
    }
    
    
    
    // MARK: - QuizDetailView
    func makeQuizView() -> QuizView {
        QuizView()
    }
    
    // MARK: - QuizDetailView
    func makeQuizDetailView() -> QuizDetailView {
        QuizDetailView()
    }
    
    // MARK: - QuizViewViewModel
    func makeQuizViewModel() -> QuizViewViewModel {
        .init(questionRepository: questionsRepository)
    }
    
}