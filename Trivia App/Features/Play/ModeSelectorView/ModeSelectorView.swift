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
            VStack(alignment: .center) {
                VStack(spacing: 10) {
                        HStack {
                            Text("Quiz Trivia App")
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                        }
                        .padding(.top)
                        
                        HStack {
                            Text("Challenge your knowledge and have fun with different gamemodes!")
                                .font(.title3)
                                .fontWeight(.light)
                            Spacer()
                        }
                }
                .padding()
                
                CardView(
                    title: "Survival",
                    message: "Reach your best streak!",
                    systemName: "trophy.fill",
                    colorsGradient: [Color(hex: 0xFF4470),
                                     Color(hex: 0xF4698A),
                                     Color(hex: 0xF89051),
                                     Color(hex: 0xFAB168)]
                )
                .padding()
                
                NavigationLink {
                    coordinator.makeQuizView()
                        .environmentObject(viewModel)
                } label: {
                    CardView(
                        title: "Quiz Mode",
                        message: "Solve a list of questions!",
                        systemName: "doc.questionmark.fill",
                        colorsGradient: [Color(hex: 0x2C3EE2),
                                         Color(hex: 0x4B69DE),
                                         Color(hex: 0x1791D6),
                                         Color(hex: 0x17AAD6)]
                    )
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.vertical)
            Spacer()
        }
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeModeSelectorView()
        .environmentObject(coordinator)
}
