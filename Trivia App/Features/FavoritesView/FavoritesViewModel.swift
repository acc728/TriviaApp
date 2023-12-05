//
//  FavoritesViewViewModel.swift
//  Trivia App
//
//  Created by user242582 on 4/12/23.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    private let favoritesRepository: FavoritesRepository    
    @Published var questions: [Question] = []
    @Published var error: Error?
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
        Task {
            await self.getFavoriteQuestions()
        }
    }
    
    @MainActor
    func getFavoriteQuestions() async {
        error = nil
        
        do {
            questions =  try await favoritesRepository.getFavoriteQuestions()
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func removeFavoriteQuestions(index: Int) async {
        error = nil
        
        do {
            try await favoritesRepository.removeFavoriteQuestion(question: self.questions[index])
            await getFavoriteQuestions()
        } catch {
            self.error = error
        }
    }
}
