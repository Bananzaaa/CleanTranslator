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
        let dataSource = LanguageListScreenDataStore()
        let service = LanguageListScreenService()
        let worker = LanguageListScreenWorker(dataStore: dataSource, service: service)
        
        // VIP Cycle Setup
        let presenter = LanguageListScreenPresenter()
        let interactor = LanguageListScreenInteractor(presenter: presenter, worker: worker)
        let viewController = LanguageListScreenViewController(interactor: interactor)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return LanguageListScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
