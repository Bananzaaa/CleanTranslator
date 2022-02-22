//  LanguageListScreenCoordinatorFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenCoordinatorFactory {
    func createLanguageListScreenCoordinator(
        navigationController: UINavigationController) -> LanguageListScreenCoordinator
}

final class MainLanguageListScreenCoordinatorFactory: LanguageListScreenCoordinatorFactory {
    
    // MARK: - Private properties
    
    private let moduleFactory: LanguageListScreenModuleFactory
    
    // MARK: - Init
    
    init(moduleFactory: LanguageListScreenModuleFactory) {
        self.moduleFactory = moduleFactory
    }
    
    // MARK: - Public methods

    func createLanguageListScreenCoordinator(
        navigationController: UINavigationController) -> LanguageListScreenCoordinator {
            
        MainLanguageListScreenCoordinator(
            navigationController: navigationController,
            moduleFactory: moduleFactory)
    }
}
