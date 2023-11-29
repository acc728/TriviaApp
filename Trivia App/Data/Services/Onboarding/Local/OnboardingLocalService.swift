//
//  OnboardingLocalService.swift
//  Trivia App
//
//  Created by user242582 on 29/11/23.
//

import Foundation

protocol OnboardingLocalService {
    func getOnboardingState() -> Bool
    func saveOnboardingState(showed: Bool)
}
