//
//  QuizDetailView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct QuizDetailView: View {
    @EnvironmentObject private var viewModel: QuizViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("quizDetailView.title".localized())
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                        LinearGradient(
                            colors: Gradients.blueGradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
                Spacer()
                
                NavigationLink() {
                    coordinator.makeModeSelectorView()
                } label: {
                    HStack {
                        Text("quizDetailView.close".localized())
                            .foregroundStyle(.red)
                            .bold()
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            
            ProgressBar(progress: viewModel.progress)
            
            HStack {
                Spacer()
                Text("\(viewModel.index + 1) out of \(viewModel.length)")
                    .font(.title3)
                    .fontWeight(.light)
            }
            .padding(.bottom)
            
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.question)
                    .font(.title)
                    .bold()
                    .lineLimit(3, reservesSpace: true)
                
                ForEach(viewModel.answerChoices) { answer in
                    QuizRowAnswer(answer: answer)
                        .environmentObject(viewModel)
                }
            }
            
            Button {
                viewModel.goNextQuestion()
            } label: {
                MainButton(
                    text: "mainButton.next".localized(),
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
    return coordinator.makeQuizDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
