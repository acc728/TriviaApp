//
//  FavoritesLocalService.swift
//  Trivia App
//
//  Created by user242582 on 3/12/23.
//

import Foundation

protocol FavoritesLocalService {
    
    func getFavoriteQuestions() async throws -> [Question]
    
    func addFavoriteQuestion(question: Question) async throws
    
    func removeFavoriteQuestion(question: Question) async throws
    
    func isFavoriteQuestion(question: Question) async throws -> Bool
    
}
