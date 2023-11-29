//
//  UserDefaultsOnboardingLocalService.swift
//  Trivia App
//
//  Created by user242582 on 29/11/23.
//

import Foundation

struct UserDefaultsOnboardingLocalService: OnboardingLocalService {
    private let onboardingKey = "onboardingShowed"

    func getOnboardingState() -> Bool {
        return UserDefaults.standard.bool(forKey: onboardingKey)
    }
    
    func saveOnboardingState(showed: Bool) {
        UserDefaults.standard.set(showed, forKey: onboardingKey)
    }
}
