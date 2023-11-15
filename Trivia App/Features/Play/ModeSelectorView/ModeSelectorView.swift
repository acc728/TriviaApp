//
//  ModeSelectorView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct ModeSelectorView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var quizViewModel: QuizViewViewModel
    @StateObject private var questionViewModel: QuestionViewViewModel
    
    init(quizViewModel: QuizViewViewModel, questionViewModel: QuestionViewViewModel) {
        _quizViewModel = StateObject(wrappedValue: quizViewModel)
        _questionViewModel = StateObject(wrappedValue: questionViewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                VStack(spacing: 10) {
                    HStack {
                        Text("Quiz Trivia App")
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: Gradients.redGradient),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Challenge your knowledge and have fun with different gamemodes!")
                            .font(.title3)
                            .fontWeight(.light)
                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 40){
                    NavigationLink {
                        coordinator.makeQuestionView()
                            .environmentObject(questionViewModel)
                    } label: {
                        CardView(
                            title: "Survival",
                            message: "Reach your best streak!",
                            systemName: "trophy.fill",
                            colorsGradient: Gradients.redGradient
                        )
                    }
                    
                    NavigationLink {
                        coordinator.makeQuizView()
                            .environmentObject(quizViewModel)
                    } label: {
                        CardView(
                            title: "Quiz Mode",
                            message: "Solve a list of questions!",
                            systemName: "doc.questionmark.fill",
                            colorsGradient: Gradients.blueGradient
                        )
                    }
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            Spacer()
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeModeSelectorView()
        .environmentObject(coordinator)
}
