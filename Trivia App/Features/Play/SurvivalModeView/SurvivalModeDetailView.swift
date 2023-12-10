//
//  QuestionDetailView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI
import SimpleToast

struct SurvivalModeDetailView: View {
    @EnvironmentObject private var viewModel: SurvivalModeViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var showToast = false
    @State private var toastColor = Color.green
    @State private var isActive = false
    
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 1,
        backdrop: .black.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Text("survivalModeDetailView.title".localized())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: Gradients.redGradient,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing))
                    Spacer()
                    
                    Button {
                        withAnimation {
                            isActive = true
                        }
                    } label: {
                        HStack {
                            Text("survivalModeDetailView.close".localized())
                                .foregroundStyle(.red)
                                .bold()
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                HStack {
                    Button {
                        Task {
                            if(!viewModel.isFavorite) {
                                await viewModel.addFavoriteQuestion()
                                toastColor = .green
                                showToast = true
                            } else {
                                await viewModel.removeFavoriteQuestion()
                                toastColor = .red
                                showToast = true
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
                
                VStack(alignment: .center, spacing: 15) {
                    Text(viewModel.questionText)
                        .font(.title2)
                        .bold()
                        .lineLimit(nil)
                    
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
                        text: "mainButton.next".localized(),
                        background: viewModel.answerSelected ? .pink: .gray
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
    return coordinator.makeSurvivalModeDetailView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeSurvivalModeViewModel())
}
