//  TranslationScreenCoordinator.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

/// Делегат координатора 
protocol TranslationScreenCoordinatorDelegate: AnyObject {}

/// Координатор
protocol TranslationScreenCoordinator: Coordinator {}

final class MainTranslationScreenCoordinator: NSObject, TranslationScreenCoordinator {
    
    // MARK: - Private properties
    
    private let moduleFactory: TranslationScreenModuleFactory
    private let translationDataStore: TranslationScreenDataStoreProtocol
    
    // MARK: - Public properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewController: UIViewController? {
        module?.viewController
    }
    var module: TranslationScreenModule?

    weak var delegate: TranslationScreenCoordinatorDelegate?
    
    // MARK: - Init
    
    init(
        navigationController: UINavigationController,
        moduleFactory: TranslationScreenModuleFactory,
        translationDataStore: TranslationScreenDataStoreProtocol) {
            
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
        self.translationDataStore = translationDataStore
    }
    
    // MARK: - Public Methods
    
    func start() {
        let module = moduleFactory.createModule(
            dataStore: translationDataStore,
            moduleOutput: self)
        self.module = module

        navigationController.pushViewController(module.viewController, animated: true)
    }

    // MARK: - Private Methods
}

extension MainTranslationScreenCoordinator: TranslationScreenModuleOutput {

}
