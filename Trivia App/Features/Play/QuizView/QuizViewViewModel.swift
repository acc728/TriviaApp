//
//  QuizViewViewModel.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class QuizViewViewModel: ObservableObject {
    private let questionRepository: QuestionsRepository
    @Published var questions: [Question] = [.example, .example, .example]
    @Published var showErrorMessage = false
    
    init(questionRepository: QuestionsRepository) {
        self.questionRepository = questionRepository
    }
    
    @MainActor
    func getQuiz() async {
        do {
            questions = try await questionRepository.getQuiz()
        } catch {
            showErrorMessage = true
        }
    }
}
