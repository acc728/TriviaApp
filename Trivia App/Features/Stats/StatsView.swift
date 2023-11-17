//
//  StatsView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct StatsView: View {
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Quiz Trivia App",
                message: "See your results in recents quizzes and best streak!",
                gradient: Gradients.redGradient
            )
            
            StreakCardView(
                imageName: "trophy",
                colorsGradient: Gradients.blueGradient,
                streak: 54)
            .padding()
            
            VStack(alignment: .leading) {
                Text("Quiz History")
                    .bold()
                    .font(.title2)
                
                Divider()
                
                VStack(alignment: .center, spacing: 30) {
                    QuizHistoryRow(numCorrects: 7)
                    QuizHistoryRow(numCorrects: 4)
                    QuizHistoryRow(numCorrects: 6)
                }.padding()
            }
            .padding()
        }
    }
}

#Preview {
    StatsView()
}
