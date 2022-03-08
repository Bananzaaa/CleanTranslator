//  ChooseLanguageListScreenCoordinatorFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

protocol ChooseLanguageListScreenCoordinatorFactory {
    func createChooseLanguageListScreenCoordinator(navigationController: UINavigationController) -> ChooseLanguageListScreenCoordinator
}

final class MainChooseLanguageListScreenCoordinatorFactory: ChooseLanguageListScreenCoordinatorFactory {
    
    // MARK: - Private properties
    
    private let moduleFactory: ChooseLanguageListScreenModuleFactory
    
    // MARK: - Init
    
    init(moduleFactory: ChooseLanguageListScreenModuleFactory) {
        self.moduleFactory = moduleFactory
    }
    
    // MARK: - Public methods

    func createChooseLanguageListScreenCoordinator(navigationController: UINavigationController) -> ChooseLanguageListScreenCoordinator {
        
        return MainChooseLanguageListScreenCoordinator(
            navigationController: navigationController,
            moduleFactory: moduleFactory)
    }
}
