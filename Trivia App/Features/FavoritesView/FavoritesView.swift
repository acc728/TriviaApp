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
            
            if(!viewModel.questions.isEmpty) {
                List {
                    ForEach(viewModel.questions) { question in
                        DisclosureGroup {
                            FavoritesDetailCardView(question: question)
                                .listRowInsets(.init(top: 0, leading: -20, bottom: 0, trailing: 15))
                        } label: {
                            FavoritesCardView(question: question)
                        }
                        .tint(LinearGradient(
                            colors: Gradients.redGradient,
                            startPoint: .leading,
                            endPoint: .trailing)
                        )
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        .listRowBackground(Color.clear)
                        
                    }
                    .onDelete(perform: { indexSet in
                        Task {
                            for index in indexSet {
                                await viewModel.removeFavoriteQuestions(index: index)
                            }
                        }
                    })
                    
                }
                .listRowSpacing(10)
                .scrollContentBackground(.hidden)
                
                Spacer()
            } else {
                VStack(alignment: .center) {
                    Spacer()
                    
                    Text("favoritesView.favoritesQuestionsEmpty".localized())
                        .font(.title2)
                        .fontWeight(.light)
                        .padding(.vertical)
                    
                    Image("question")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 130)
                    
                    Spacer()
                }
            }
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
