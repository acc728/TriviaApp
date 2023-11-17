//
//  QuizView.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var viewModel: QuizViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        if viewModel.reachedEnd {
            VStack(spacing: 20) {
                Text("Quiz Trivia App")
                    .font(.title)
                    .bold()
                    .foregroundStyle(
                        LinearGradient(
                            colors: Gradients.blueGradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                
                Text("Congratulations, you completed the quiz!")
                
                Image("trophy")
                    .resizable()
                    .scaledToFit()
                
                Text("You scored \(viewModel.score) out of \(viewModel.length)")
                    .bold()
                
                NavigationLink {
                    coordinator.makeModeSelectorView()
                } label: {
                    MainButton(
                        text: "Return to Menu")
                }
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    viewModel.saveQuizHistory()
                }
            }
        } else {
            coordinator.makeQuizDetailView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
