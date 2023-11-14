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
                Text("questionView.title".localized())
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
                
                Text("\(viewModel.index + 1) out of \(viewModel.length)")
                    .font(.title3)
                    .fontWeight(.heavy)
                
                Button {
                    
                } label: {
                    Image(systemName: "x.circle.fill")
                }
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
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
