//
//  StatsView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct StatsView: View {
    @StateObject private var viewModel: StatsViewViewModel
    
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
            
            VStack(alignment: .leading) {
                Text("Quiz History")
                    .bold()
                    .font(.title2)
                
                Divider()
                
                if !viewModel.quizHistory.isEmpty {
                    VStack(alignment: .center, spacing: 30) {
                        ScrollView {
                            ForEach(viewModel.quizHistory.indices, id: \.self) { index in
                                if index <= viewModel.quizHistory.count {
                                    QuizHistoryRow(numCorrects: viewModel.quizHistory[index])
                                        .padding(.vertical)
                                }
                            }
                        }
                    }.padding(10)
                } else {
                    HStack {
                        Spacer()
                        Text("Couldn't find any quiz history")
                            .font(.title2)
                            .fontWeight(.light)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Image("question")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 130)
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
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeStatsView()
}
