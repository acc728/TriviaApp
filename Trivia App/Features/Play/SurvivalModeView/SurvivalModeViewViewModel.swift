//
//  QuestionsViewModel.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class SurvivalModeViewViewModel: ObservableObject {
    private let questionRepository: QuestionsRepository
    @Published var question: Question = .example
    @Published var showErrorMessage = false
    @Published private(set) var answerSelected = false
    @Published private(set) var questionText: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var streak: Int = 0
    @Published private(set) var failed = false
    @Published private(set) var reachedEnd = false
    
    init(questionRepository: QuestionsRepository) {
        self.questionRepository = questionRepository
        Task {
            await self.getQuestion()
            await self.setQuestion()
        }
    }
    
    @MainActor
    func getQuestion() async {
        do {
            if !failed {
                question = try await questionRepository.getQuestion()
                setQuestion()
            } else {
                reachedEnd = true
            }
            
        } catch {
            showErrorMessage = true
        }
    }
    
    @MainActor
    func setQuestion() {
        questionText = question.formattedQuestion
        answerChoices = question.answers
        answerSelected = false
        reachedEnd = false
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            streak += 1
        } else {
            failed = true
        }
    }
    
    func saveStreak() {
        questionRepository.saveStreak(streak: self.streak)
    }
    
    func getStreak() -> Int {
        return questionRepository.getStreak()
    }
}