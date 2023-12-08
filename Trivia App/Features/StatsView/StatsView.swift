//
//  StatsView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct StatsView: View {
    @StateObject private var viewModel: StatsViewViewModel
    @Environment(\.colorScheme) var colorScheme
    
    init(viewModel: StatsViewViewModel) {
        _viewModel =  StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Quiz Trivia App",
                message: "See your results in recents quizzes and best streak!",
                gradient: Gradients.redGradient
            )
            
            StreakCardView(
                imageName: "trophy",
                colorsGradient: Gradients.redGradient,
                streak: viewModel.streak)
            .padding()
            
            VStack {
                HStack {
                    Text("Quiz History")
                        .bold()
                    .font(.title2)
                    Spacer()
                }
                
                Divider().background(colorScheme == .light ? .black : .white)
                
                if !viewModel.quizHistory.isEmpty {
                    VStack(alignment: .center, spacing: 30) {
                        ScrollView {
                            ForEach(viewModel.quizHistory.indices, id: \.self) { index in
                                if index <= viewModel.quizHistory.count {
                                    QuizHistoryRow(numCorrects: viewModel.quizHistory[index], index: index)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }.padding(.horizontal, 0)
                } else {
                    VStack {
                        Spacer()
                        Image("historyNotFound")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                        
                        Text("Couldn't find any quiz history")
                            .font(.title2)
                            .fontWeight(.light)
                            .padding(.vertical)
                        
                        
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            viewModel.getStreak()
            viewModel.getQuizHistory()
        }
        .setBackgroundApp()
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeStatsView()
}
