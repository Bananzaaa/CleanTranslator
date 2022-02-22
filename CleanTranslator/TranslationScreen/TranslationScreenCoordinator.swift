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
        moduleFactory: TranslationScreenModuleFactory) {
            
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
    // MARK: - Public Methods
    
    func start() {
        let module = moduleFactory.createModule(moduleOutput: self)
        self.module = module

        navigationController.pushViewController(module.viewController, animated: true)
    }

    // MARK: - Private Methods
}

extension MainTranslationScreenCoordinator: TranslationScreenModuleOutput {

}
