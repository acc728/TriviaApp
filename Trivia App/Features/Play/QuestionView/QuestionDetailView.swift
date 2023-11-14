//
//  QuestionDetailView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct QuestionDetailView: View {
    @EnvironmentObject private var viewModel: QuestionViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("questionView.title".localized())
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
                
                NavigationLink {
                    coordinator.makeModeSelectorView()
                } label: {
                    Image(systemName: "x.circle.fill")
                }
            }
            
            Text("You have a streak of \(viewModel.streak)")
            
            
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.questionText)
                    .font(.title)
                    .bold()
                
                ForEach(viewModel.answerChoices) { answer in
                    QuestionRowAnswer(answer: answer)
                        .environmentObject(viewModel)
                }
            }
            
            Button {
                Task {
                    await viewModel.getQuestion()
                }
            } label: {
                MainButton(
                    text: "Next",
                    background: viewModel.answerSelected ? Color("AccentColor"): .gray
                )
            }
            .disabled(!viewModel.answerSelected)
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuestionViewModel())
}
