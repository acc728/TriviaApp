//
//  FavoritesRepository.swift
//  Trivia App
//
//  Created by user242582 on 3/12/23.
//

import Foundation

struct FavoritesRepository {
    private let localService: FavoritesLocalService
    
    init(localService: FavoritesLocalService) {
        self.localService = localService
    }
    
    func getFavoriteQuestions() async throws -> [Question] {
        return try await localService.getFavoriteQuestions()
    }
    
    func addFavoriteQuestion(question: Question) async throws {
        try await localService.addFavoriteQuestion(question: question)
    }
    
    func removeFavoriteQuestion(question: Question) async throws {
        try await localService.removeFavoriteQuestion(question: question)
    }
    
    func isFavoriteQuestion(question: Question) async throws -> Bool {
        return try await localService.isFavoriteQuestion(question: question)
    }
}
