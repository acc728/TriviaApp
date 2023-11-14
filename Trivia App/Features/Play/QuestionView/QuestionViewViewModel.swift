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
    @Published private(set) var answerSelected = false
    @Published private(set) var questionText: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var streak = 0
    @Published private(set) var failed = false
    @Published private(set) var reachedEnd = false
    
    init(questionRepository: QuestionsRepository) {
        self.questionRepository = questionRepository
        Task {
            await self.getQuestion()
        }
    }
    
    @MainActor
    func getQuestion() async {
        do {
            if !failed {
                question = try await questionRepository.getQuestion()
                questionText = question.formattedQuestion
                answerChoices = question.answers
                answerSelected = false
                reachedEnd = false
            } else {
                reachedEnd = true
            }
            
        } catch {
            showErrorMessage = true
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            streak += 1
        } else {
            failed = true
        }
    }
}
