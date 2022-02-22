//  LanguageListScreenCoordinator.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

/// Делегат координатора 
protocol LanguageListScreenCoordinatorDelegate: AnyObject {}

/// Координатор
protocol LanguageListScreenCoordinator: Coordinator {}

final class MainLanguageListScreenCoordinator: NSObject, LanguageListScreenCoordinator {
    
    // MARK: - Private properties
    
    private let moduleFactory: LanguageListScreenModuleFactory
    
    // MARK: - Public properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewController: UIViewController? {
        module?.viewController
    }
    var module: LanguageListScreenModule?

    weak var delegate: LanguageListScreenCoordinatorDelegate?
    
    // MARK: - Init
    
    init(
        navigationController: UINavigationController,
        moduleFactory: LanguageListScreenModuleFactory) {
            
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

extension MainLanguageListScreenCoordinator: LanguageListScreenModuleOutput {

}
