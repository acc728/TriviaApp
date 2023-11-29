//
//  OnboardingRepository.swift
//  Trivia App
//
//  Created by user242582 on 29/11/23.
//

import Foundation

struct OnboardingRepository {
    private let localService: OnboardingLocalService
    
    init(localService: OnboardingLocalService) {
        self.localService = localService
    }
    
    func getOnboardingState() -> Bool {
        return localService.getOnboardingState()
    }
    
    func saveOnboardingState(showed: Bool) {
        localService.saveOnboardingState(showed: showed)
    }
}
