//
//  CoreDataFavoritesLocalService.swift
//  Trivia App
//
//  Created by user242582 on 4/12/23.
//

import Foundation
import CoreData

// NOTA: - Se podria hacer con UserDefaults en el questionsRepository
// pero por aprendizaje se ha implementado con CoreData.

struct CoreDataFavoritesLocalService: FavoritesLocalService {
    
    let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    
    func getFavoriteQuestions() async throws -> [Question] {
        let fetchRequest = CDFavorites.fetchRequest()
        let cdFavorites = try container.viewContext.fetch(fetchRequest)
        
        let questionsFavorites = cdFavorites.map { cdFavorite in
            return Question(
                id: cdFavorite.id ?? "",
                category: cdFavorite.category ?? "",
                type: cdFavorite.type ?? "",
                difficulty: cdFavorite.difficulty ?? "",
                question: cdFavorite.question ?? "",
                correctAnswer: cdFavorite.correctAnswer ?? "",
                incorrectAnswers: cdFavorite.incorrectAnswers ?? [])
        }
        
        return questionsFavorites
    }
    
    func addFavoriteQuestion(question: Question) async throws {
        let cdFavorite = CDFavorites(context: container.viewContext)
        
        cdFavorite.id = question.id
        cdFavorite.category = question.category
        cdFavorite.correctAnswer = question.correctAnswer
        cdFavorite.difficulty = question.difficulty
        cdFavorite.incorrectAnswers = question.incorrectAnswers
        cdFavorite.type = question.type
        cdFavorite.question = question.formattedQuestion.description
        
        try container.viewContext.save()
    }
    
    func removeFavoriteQuestion(question: Question) async throws {
        let fetchRequest = CDFavorites.fetchRequest()
        let cdFavorites = try container.viewContext.fetch(fetchRequest)
        
        guard let cdFavorite = (cdFavorites.first { fav in
            fav.id == question.id
        }) else {
            return
        }
        
        container.viewContext.delete(cdFavorite)
        
        try container.viewContext.save()
    }
    
}
