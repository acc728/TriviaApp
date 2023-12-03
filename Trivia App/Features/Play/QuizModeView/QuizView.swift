//
//  QuizView.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var viewModel: QuizViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        if viewModel.reachedEnd {
            ZStack {
                Color("MainColor")
                    .ignoresSafeArea()
                
                VStack {
                    LottieView(loopMode: .loop, animationName: "congratulations")
                    Spacer()
                }.padding(.bottom, 300)
                
                
                VStack(spacing: 20) {
                    Text("quizView.title")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .foregroundStyle(
                            LinearGradient(
                                colors: Gradients.blueGradient,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("quizView.message".localized())
                        
                        Text("You scored \(viewModel.score) out of \(viewModel.length)")
                            .bold()
                        
                        NavigationLink {
                            coordinator.makeModeSelectorView()
                        } label: {
                            MainButton(
                                text: "mainButton.returnMenu".localized())
                        }
                        .navigationBarBackButtonHidden(true)
                        .onAppear {
                            viewModel.saveQuizHistory()
                        }
                        
                    }.padding(.top, 150)
                    
                    Spacer()
                }
            }
        } else {
            coordinator.makeQuizDetailView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuizView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuizViewModel())
}
