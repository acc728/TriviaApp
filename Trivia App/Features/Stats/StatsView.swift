//
//  StatsView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct StatsView: View {
    
    var body: some View {
        HeaderView(
            title: "Quiz Trivia App",
            message: "See your results in recents quizzes and best streak!",
            gradient: Gradients.redGradient
        )
        
        //Card with best streak info
        
        //ForEach or Manual List with recents results in quiz mode (Use progressView?)
    }
}

#Preview {
    StatsView()
}
