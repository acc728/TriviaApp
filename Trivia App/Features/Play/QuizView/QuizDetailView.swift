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
    //@State var closeQuizAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("questionView.title".localized())
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
                        Text("Close Quiz")
                            .foregroundStyle(.red)
                            .bold()
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                
                /*Button {
                    closeQuizAlert = true
                } label: {
                    Image(systemName: "x.circle.fill")
                }*/
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
                    text: "Next",
                    background: viewModel.answerSelected ? Color("AccentColor"): .gray
                )
            }
            .disabled(!viewModel.answerSelected)
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        /*.alert(isPresented: $closeQuizAlert) {
            Alert(
                title: Text("Would like to close the quiz?"),
                message: Text("You will lost all the progress"),
                primaryButton: .destructive(Text("Exit")) {
                    
                },
                secondaryButton: .cancel() {
                    closeQuizAlert = false
                }

            )
        }*/
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
