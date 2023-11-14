//
//  QuestionView.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject private var viewModel: QuestionViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        if viewModel.reachedEnd {
            VStack(spacing: 20) {
                Text("Quiz Trivia App")
                    .font(.title)
                    .bold()
                
                Text("Oops you lost your streak. Dont worry and try it again!")
                
                Text("You got a streak of \(viewModel.streak)")
                
                NavigationLink {
                    coordinator.makeModeSelectorView()
                } label: {
                    MainButton(text: "Return to Menu")
                }
                .navigationBarBackButtonHidden(true)
            }
        } else {
            coordinator.makeQuestionDetailView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuestionViewModel())
}
