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
    @StateObject private var questionViewModel: SurvivalModeViewViewModel
    
    init(quizViewModel: QuizViewViewModel, questionViewModel: SurvivalModeViewViewModel) {
        _quizViewModel = StateObject(wrappedValue: quizViewModel)
        _questionViewModel = StateObject(wrappedValue: questionViewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                HeaderView(
                    title: "modeSelectorView.title".localized(),
                    message: "modeSelectorView.message".localized(),
                    gradient: Gradients.redGradient
                )
                
                VStack(spacing: 40){
                    NavigationLink {
                        coordinator.makeSurvivalModeView()
                            .environmentObject(questionViewModel)
                    } label: {
                        CardView(
                            title: "Survival",
                            message: "Reach your best streak!",
                            systemName: "trophy.fill",
                            imageName: "trophy",
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
                            imageName: "question",
                            colorsGradient: Gradients.blueGradient
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
            }
            .setBackgroundApp()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeModeSelectorView()
        .environmentObject(coordinator)
}
