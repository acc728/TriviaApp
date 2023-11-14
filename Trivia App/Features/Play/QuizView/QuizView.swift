//
//  QuizView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var viewModel: QuizViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: QuizViewViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("questionView.title".localized())
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
                
                Text("\(viewModel.index + 1) out of \(viewModel.length)")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: viewModel.progress)
                .padding(.bottom)
            
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.question)
                    .font(.title)
                    .bold()
                
                ForEach(viewModel.answerChoices) { answer in
                    RowAnswer(answer: answer)
                        .environmentObject(viewModel)
                }
            }
            
            Button {
                viewModel.goNextQuestion()
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
        .task {
            await viewModel.getQuiz()
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizView()
        .environmentObject(coordinator)
}
