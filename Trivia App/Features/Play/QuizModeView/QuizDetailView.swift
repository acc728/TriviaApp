//
//  QuizDetailView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI
import SimpleToast

struct QuizDetailView: View {
    @EnvironmentObject private var viewModel: QuizViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var showToast = false
    @State private var toastColor = Color.green
    @State private var isActive = false
    @State private var goBack = false
    
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 1,
        backdrop: .black.opacity(0.1),
        animation: .default,
        modifierType: .slide
    )
    
    var body: some View {
        ZStack {
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
                    
                    Button {
                        withAnimation() {
                            isActive = true
                        }
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
                    Button {
                        Task {
                            if(viewModel.currentQuestion != nil) {
                                if(!viewModel.isFavorite) {
                                    await viewModel.addFavoriteQuestion()
                                    print("Question value (is favorite): " + viewModel.isFavorite.description)
                                    toastColor = .green
                                    showToast = true
                                } else {
                                    await viewModel.removeFavoriteQuestion()
                                    print("Question value (not favorite): " + viewModel.isFavorite.description)
                                    toastColor = .red
                                    showToast = true
                                }
                            }
                            
                        }
                    } label: {
                        Label("Add Favs", systemImage: viewModel.isFavorite ? "star.fill" : "star")
                            .foregroundStyle(
                                LinearGradient(
                                    colors: Gradients.redGradient,
                                    startPoint: .trailing,
                                    endPoint: .leading)
                            )
                    }
                    
                    Spacer()
                    
                    Text("\(viewModel.index + 1) out of \(viewModel.length)")
                        .font(.title3)
                        .fontWeight(.light)
                }
                .padding(.bottom, 10)
                
                VStack(alignment: .center, spacing: 15) {
                    Text(viewModel.question)
                        .font(.title2)
                        .bold()
                        .lineLimit(nil)
                    
                    ForEach(viewModel.answerChoices) { answer in
                        QuizRowAnswer(answer: answer)
                            .environmentObject(viewModel)
                    }
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ).combined(with: .opacity)
                    )
                }
                
                
                Button {
                    withAnimation {
                        viewModel.goNextQuestion()
                    }
                } label: {
                    MainButton(
                        text: "mainButton.next".localized(),
                        background: viewModel.answerSelected ? Color("AccentColor"): .gray
                    )
                }
                .disabled(!viewModel.answerSelected)
                
                Spacer()
                
            }
            .padding()
            .simpleToast(isPresented: $showToast, options: toastOptions, content: {
                HStack {
                    Image(systemName: toastColor == .green ? "checkmark.circle.fill" : "x.circle.fill")
                    Text( toastColor == .green ? "Added to favorites": "Removed from favorites")
                }
                .padding()
                .background(toastColor.opacity(0.8))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            })
            .navigationBarBackButtonHidden(true)
            .setBackgroundApp()
            
            if (isActive) {
                CustomDialog(isActive: $isActive,
                             title: "customDialog.title".localized(),
                             message: "customDialog.message".localized(),
                             view: AnyView(coordinator.makeModeSelectorView()))
            }
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
