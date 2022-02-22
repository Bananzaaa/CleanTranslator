//  TranslationScreenModuleFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

struct TranslationScreenModule {
    var viewController: UIViewController
    var updater: TranslationScreenUpdater?
}

protocol TranslationScreenModuleFactory {
    func createModule(
        moduleOutput delegate: TranslationScreenModuleOutput?) -> TranslationScreenModule
}

final class MainTranslationScreenModuleFactory: TranslationScreenModuleFactory {
    
    // MARK: - Public methods

    func createModule(
        moduleOutput delegate: TranslationScreenModuleOutput?) -> TranslationScreenModule {
        
        // Worker Setup
        let dataSource = TranslationScreenDataStore()
        let service = ServiceLayer.shared.translationService
        let worker = TranslationScreenWorker(dataStore: dataSource, service: service)
        
        // VIP Cycle Setup
        let presenter = TranslationScreenPresenter()
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        let viewController = TranslationScreenViewController(interactor: interactor)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return TranslationScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
