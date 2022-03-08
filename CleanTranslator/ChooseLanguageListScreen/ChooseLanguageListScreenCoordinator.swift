//  ChooseLanguageListScreenCoordinator.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

/// Делегат координатора 
protocol ChooseLanguageListScreenCoordinatorDelegate: AnyObject {
    func didChooseLanguage(_ languageModelId: String)
}

/// Координатор
protocol ChooseLanguageListScreenCoordinator: Coordinator {
    var delegate: ChooseLanguageListScreenCoordinatorDelegate? { get set }
}

final class MainChooseLanguageListScreenCoordinator: NSObject, ChooseLanguageListScreenCoordinator {
    
    // MARK: - Private properties
    
    private let moduleFactory: ChooseLanguageListScreenModuleFactory
    
    // MARK: - Public properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewController: UIViewController? {
        module?.viewController
    }
    var module: ChooseLanguageListScreenModule?

    weak var delegate: ChooseLanguageListScreenCoordinatorDelegate?
    
    // MARK: - Init
    
    init(
        navigationController: UINavigationController,
        moduleFactory: ChooseLanguageListScreenModuleFactory) {
            
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

extension MainChooseLanguageListScreenCoordinator: ChooseLanguageListScreenModuleOutput {
    func didChooseLanguage(_ languageModelId: String) {
        delegate?.didChooseLanguage(languageModelId)
    }
}
