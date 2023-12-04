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
    
    /*
    func getOnboardingState() -> Bool {
        return localService.getOnboardingState()
    }
    
    func saveOnboardingState(showed: Bool) {
        localService.saveOnboardingState(showed: showed)
    }*/
}
