//
//  ModeSelectorView.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct ModeSelectorView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: QuizViewViewModel
    
    init(viewModel: QuizViewViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20){
                Text("PLAY TRIVIA !")
                    .font(.largeTitle)
                    .bold()
                
                Text("Select Survival mode and try to get the best streak you can!")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                MainButton(text: "Survival Mode")
                
                Text("Select Quiz mode to play with a 10 questions quiz !")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                NavigationLink {
                    coordinator.makeQuizView()
                        .environmentObject(viewModel)
                } label: {
                    MainButton(text: "Quiz Mode")
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeModeSelectorView()
        .environmentObject(coordinator)
}
