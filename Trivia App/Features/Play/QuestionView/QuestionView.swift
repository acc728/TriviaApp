//
//  QuestionView.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject private var viewModel: QuestionViewViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        if viewModel.reachedEnd {
            ZStack {
                VStack {
                    LottieView(loopMode: .loop, animationName: "congratulations")
                    Spacer()
                }.padding(.bottom, 300)
                
                VStack(spacing: 20) {
                    Text("Quiz Trivia App")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: Gradients.redGradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Spacer()
                    
                    VStack {
                        Text("Oops you lost your streak. Keep trying!")
                        
                        HStack {
                            Text("You got a streak of \(viewModel.streak)")
                                .font(.title3)
                                .fontWeight(.light)
                                .bold()
                            
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
                        
                        NavigationLink {
                            coordinator.makeModeSelectorView()
                        } label: {
                            MainButton(text: "Return to Menu", background: .pink)
                        }
                        .navigationBarBackButtonHidden(true)
                        .onAppear {
                            let bestStreakLocal = viewModel.getStreak()
                            if viewModel.streak > bestStreakLocal {
                                viewModel.saveStreak()
                            }
                        }
                    }.padding(.top, 150)
                    
                    
                    Spacer()
                }
            }
        } else {
            coordinator.makeQuestionDetailView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeQuestionView()
        .environmentObject(coordinator)
        .environmentObject(coordinator.makeQuestionViewModel())
}
