//
//  FavoritesView.swift
//  Trivia App
//
//  Created by user242582 on 4/12/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        _viewModel =  StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Quiz Trivia App",
                message: "See your favorites questions and repeat them to learn!",
                gradient: Gradients.redGradient
            )
            
            Spacer()
            List {
                ForEach(viewModel.questions) { question in
                    Text(question.formattedQuestion)
                        
                }
                .onDelete(perform: { indexSet in
                    viewModel.questions.remove(atOffsets: indexSet)
                })
                
                
            }
            Spacer()
            
        }.setBackgroundApp()
        .task {
            await viewModel.getFavoriteQuestions()
        }
    }
    
}



#Preview {
    let coordinator = Coordinator()
    return coordinator.makeFavoritesView()
}
