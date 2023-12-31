//
//  Coordinator.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    private let questionsRepository: QuestionsRepository
    private let onboardingRepository: OnboardingRepository
    private let favoritesRepository: FavoritesRepository
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        let questionsRemoteService: QuestionsRemoteService = mock ? MockQuestionsRemoteService() : LiveQuestionsRemoteService(networkClient: networkClient)
        let questionsLocalService: QuestionsLocalService = UserDefaultsQuestionsLocalService()
        
        let onboardingLocalService: OnboardingLocalService = UserDefaultsOnboardingLocalService()
        
        let persistentController = CoreDataPersistentController()
        
        questionsRepository = QuestionsRepository(remoteService: questionsRemoteService, localService: questionsLocalService)
        onboardingRepository = OnboardingRepository(localService: onboardingLocalService)
        
        favoritesRepository = FavoritesRepository(
            localService: CoreDataFavoritesLocalService(container: persistentController.container))
        
    }
    
    // MARK: - ModeSelectorView
    func makeModeSelectorView() -> ModeSelectorView {
        ModeSelectorView(
            quizViewModel: makeQuizViewModel(),
            questionViewModel: makeSurvivalModeViewModel()
        )
    }
    
    
    
    // MARK: - SurvivalModeView
    func makeSurvivalModeView() -> SurvivalModeView {
        SurvivalModeView()
    }
    
    // MARK: - QuestionDetailView
    func makeSurvivalModeDetailView() -> SurvivalModeDetailView {
        SurvivalModeDetailView()
    }
    
    // MARK: - QuestionViewViewModel
    func makeSurvivalModeViewModel() -> SurvivalModeViewViewModel {
        .init(questionRepository: questionsRepository, favoritesRepository: favoritesRepository)
    }
    
    
    
    // MARK: - QuizView
    func makeQuizView() -> QuizView {
        QuizView()
    }
    
    // MARK: - QuizDetailView
    func makeQuizDetailView() -> QuizDetailView {
        QuizDetailView()
    }
    
    // MARK: - QuizViewViewModel
    func makeQuizViewModel() -> QuizViewViewModel {
        .init(questionRepository: questionsRepository, favoritesRepository: favoritesRepository)
    }
    
    
    
    // MARK: - StatsView
    func makeStatsView() -> StatsView {
        StatsView(viewModel: makeStatsViewModel())
    }
    
    // MARK: - StatsViewModel
    func makeStatsViewModel() -> StatsViewViewModel {
        .init(repository: questionsRepository)
    }
    
    
    
    // MARK: - FavoritesView
    func makeFavoritesView() -> FavoritesView {
        FavoritesView(viewModel: makeFavoritesViewModel())
    }
    
    // MARK: - StatsViewModel
    func makeFavoritesViewModel() -> FavoritesViewModel {
        .init(favoritesRepository: favoritesRepository)
    }
    
    
    
    // MARK: - OnboardingViewModel
    func makeOnboardingViewModel() -> OnboardingViewModel {
        OnboardingViewModel(onboardingrepository: onboardingRepository)
    }
}
