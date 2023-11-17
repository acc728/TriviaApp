//
//  QuizViewViewModel.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

class QuizViewViewModel: ObservableObject {
    private let questionRepository: QuestionsRepository
    @Published var quiz: [Question] = []
    @Published var showErrorMessage = false
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    
    
    init(questionRepository: QuestionsRepository) {
        self.questionRepository = questionRepository
        Task {
            await self.getQuiz()
        }
    }
    
    @MainActor
    func getQuiz() async {
        do {
            self.index = 0
            self.score = 0
            self.progress = 0.0
            self.reachedEnd = false
            
            quiz = try await questionRepository.getQuiz()
            self.length = quiz.count
            self.setQuestion()
        } catch {
            showErrorMessage = true
        }
    }
    
    func goNextQuestion(){
        if index + 1 < length {
            index += 1
            progress += 1.0
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = (Double(index) + 1.0) / 10.0
        
        if index < length {
            let currentQuestion = quiz[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    func saveQuizHistory() {
        do {
            try questionRepository.saveQuizHistory(quizHistory: [score])
        } catch {
            showErrorMessage = true
        }
    }
}
