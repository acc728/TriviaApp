//
//  QuestionsViewModel.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class SurvivalModeViewViewModel: ObservableObject {
    private let questionRepository: QuestionsRepository
    private let favoritesRepository: FavoritesRepository
    
    @Published var question: Question = .example
    @Published var showErrorMessage = false
    @Published private(set) var answerSelected = false
    @Published private(set) var questionText: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var streak: Int = 0
    @Published private(set) var failed = false
    @Published private(set) var reachedEnd = false
    @Published private(set) var isFavorite = false
    
    init(questionRepository: QuestionsRepository, favoritesRepository: FavoritesRepository) {
        self.questionRepository = questionRepository
        self.favoritesRepository = favoritesRepository
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
                await isFavoriteQuestion()
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
    
    @MainActor
    func addFavoriteQuestion() async {
        do {
            try await favoritesRepository.addFavoriteQuestion(question: self.question)
            await isFavoriteQuestion()
        } catch {
            showErrorMessage = true
        }
    }
    
    @MainActor
    func removeFavoriteQuestion() async {
        do {
            try await favoritesRepository.removeFavoriteQuestion(question: self.question)
            await isFavoriteQuestion()
        } catch {
            showErrorMessage = true
        }
    }
    
    @MainActor
    private func isFavoriteQuestion() async {
        do {
            isFavorite = try await favoritesRepository.isFavoriteQuestion(question: self.question)
        } catch {
            showErrorMessage = true
        }
    }
}
