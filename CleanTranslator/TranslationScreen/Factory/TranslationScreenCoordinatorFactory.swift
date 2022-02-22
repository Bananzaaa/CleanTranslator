//  TranslationScreenCoordinatorFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenCoordinatorFactory {
    func createTranslationScreenCoordinator(
        navigationController: UINavigationController) -> TranslationScreenCoordinator
}

final class MainTranslationScreenCoordinatorFactory: TranslationScreenCoordinatorFactory {
    
    // MARK: - Private properties
    
    private let moduleFactory: TranslationScreenModuleFactory
    
    // MARK: - Init
    
    init(moduleFactory: TranslationScreenModuleFactory) {
        self.moduleFactory = moduleFactory
    }
    
    // MARK: - Public methods

    func createTranslationScreenCoordinator(
        navigationController: UINavigationController) -> TranslationScreenCoordinator {
        
        MainTranslationScreenCoordinator(
            navigationController: navigationController,
            moduleFactory: moduleFactory)
    }
}
