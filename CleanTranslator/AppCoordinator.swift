//
//  AppCoordinator.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import UIKit

protocol AppCoordinator: Coordinator {}

final class MainAppCoordinator: NSObject, AppCoordinator {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    
    // MARK: - Public properties
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController: UIViewController?
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    // MARK: - Public methods
    
    func start() {
        setupWindow()
        showTranslationScreen()
    }
    
    // MARK: - Private methods
    
    private func setupWindow() {
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    private func showLanguageListScreen() {
        let moduleFactory = MainLanguageListScreenModuleFactory()
        let coordinatorFactory = MainLanguageListScreenCoordinatorFactory(moduleFactory: moduleFactory)
        let coordinator = coordinatorFactory
            .createLanguageListScreenCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func showTranslationScreen() {
        let moduleFactory = MainTranslationScreenModuleFactory()
        let coordinatorFactory = MainTranslationScreenCoordinatorFactory(moduleFactory: moduleFactory)
        let coordinator = coordinatorFactory
            .createTranslationScreenCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
