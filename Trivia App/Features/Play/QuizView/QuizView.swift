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
                
                Text("Congratulations, you completed the quiz!")
                
                Text("You scored \(viewModel.score) out of \(viewModel.length)")
                
                NavigationLink {
                    coordinator.makeModeSelectorView()
                } label: {
                    MainButton(
                        text: "Return to Menu")
                }
                .navigationBarBackButtonHidden(true)
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
