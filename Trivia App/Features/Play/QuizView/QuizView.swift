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
    @State var index = 0.0
    
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
                Text("\(Int(index + 1)) out of 10" )
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: (index + 1.0) / 10.0)
                .padding(.bottom)
            
            //coordinator.makeQuestionView()
                                                                       
            MainButton(text: (index < 10 ? "Next" : "Finish"))
                .onTapGesture {
                    if index < 10 {
                        index += 1
                    }
                }
            
            Spacer()
            
        }.padding()
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
