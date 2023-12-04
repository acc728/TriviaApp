//
//  QuestionDetailView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct SurvivalModeDetailView: View {
    @EnvironmentObject private var viewModel: SurvivalModeViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("questionDetailView.title".localized())
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                        LinearGradient(
                            colors: Gradients.redGradient,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                Spacer()
                
                NavigationLink() {
                    coordinator.makeModeSelectorView()
                } label: {
                    HStack {
                        Text("questionDetailView.close".localized())
                            .foregroundStyle(.red)
                            .bold()
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            
            HStack {
                
                Button {
                    
                } label: {
                    Label("Add Favs", systemImage: "star.fill")
                        .foregroundStyle(
                            LinearGradient(
                                colors: Gradients.redGradient,
                                startPoint: .trailing,
                                endPoint: .leading)
                        )
                }
                
                Spacer()
                
                Text("You have a streak of \(viewModel.streak)")
                    .font(.title3)
                    .fontWeight(.light)
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .frame(width: 25,height: 30)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: Gradients.redGradient),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.questionText)
                    .font(.title)
                    .bold()
                    .lineLimit(3, reservesSpace: true)
                
                ForEach(viewModel.answerChoices) { answer in
                    QuestionRowAnswer(answer: answer)
                        .environmentObject(viewModel)
                }.transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    ).combined(with: .opacity)
                )
            }
            .padding(.top)
            
            Button {
                Task {
                    await viewModel.getQuestion()
                }
                withAnimation {
                    viewModel.setQuestion()
                }
            } label: {
                MainButton(
                    text: "Next",
                    background: viewModel.answerSelected ? .pink: .gray
                )
            }
            .disabled(!viewModel.answerSelected)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .setBackgroundApp()
        //.animation(.easeInOut, value: viewModel.answerChoices)
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeSurvivalModeDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeSurvivalModeViewModel())
}
