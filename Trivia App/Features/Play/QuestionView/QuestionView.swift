//
//  QuestionsView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel: QuestionViewViewModel
    //var question : Question
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: QuestionViewViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
               /*HStack {
                    Text("questionView.title".localized())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("1 out of 10" )
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                
                ProgressBar(progress: 0.7)
                    .padding(.bottom)*/
                
                VStack(alignment: .center, spacing: 20) {
                    Text(viewModel.question.formattedQuestion)
                        .font(.title)
                        .bold()
                    
                    ForEach(viewModel.question.answers) { answer in
                        RowAnswer(answer: Answer(text: answer.text, isCorrect: answer.isCorrect))
                            .environmentObject(viewModel)
                    }
                }
                
                NavigationLink {
                    coordinator.makeQuestionView()
                } label: {
                    MainButton(text: "Next")
                }
                
                Spacer()
                
            }.padding()
            .task {
                await viewModel.getQuestion()
            }
        }
        
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionView()
        .environmentObject(coordinator)
}
