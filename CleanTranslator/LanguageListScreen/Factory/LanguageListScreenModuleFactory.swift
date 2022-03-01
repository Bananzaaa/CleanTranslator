//  LanguageListScreenModuleFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

struct LanguageListScreenModule {
    var viewController: UIViewController
    var updater: LanguageListScreenUpdater?
}

protocol LanguageListScreenModuleFactory {
    func createModule(
        moduleOutput delegate: LanguageListScreenModuleOutput?) -> LanguageListScreenModule
}

final class MainLanguageListScreenModuleFactory: LanguageListScreenModuleFactory {
    
    // MARK: - Public methods

    func createModule(
        moduleOutput delegate: LanguageListScreenModuleOutput?) -> LanguageListScreenModule {
        
        // Worker Setup
        let dataStore = LanguageListScreenDataStore()
        let service = ServiceLayer.shared.translationService
        let worker = LanguageListScreenWorker(dataStore: dataStore, service: service)
        
        // VIP Cycle Setup
        let presenter = LanguageListScreenPresenter()
        let interactor = LanguageListScreenInteractor(presenter: presenter, worker: worker)
            
        let languageListManager = MainLanguageListManager()
        let viewController = LanguageListScreenViewController(
            interactor: interactor,
            tableManager: languageListManager)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return LanguageListScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
