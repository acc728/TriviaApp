//
//  OnboardingViewModel.swift
//  Trivia App
//
//  Created by user242582 on 29/11/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    private let onboardingrepository: OnboardingRepository
    
    init(onboardingrepository: OnboardingRepository) {
        self.onboardingrepository = onboardingrepository
    }
    
    func getOnboardingState() -> Bool {
        return onboardingrepository.getOnboardingState()
    }
    
    func saveOnboardingState(showed: Bool) {
        onboardingrepository.saveOnboardingState(showed: showed)
    }
}
