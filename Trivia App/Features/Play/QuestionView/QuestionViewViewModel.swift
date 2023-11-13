//
//  QuestionsViewModel.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class QuestionViewViewModel: ObservableObject {
    private let questionRepository: QuestionsRepository
    @Published var question: Question = .example
    @Published var showErrorMessage = false
    
    init(questionRepository: QuestionsRepository) {
        self.questionRepository = questionRepository
    }
    
    @MainActor
    func getQuestion() async {
        do {
            question = try await questionRepository.getQuestion()
        } catch {
            showErrorMessage = true
        }
    }
}
