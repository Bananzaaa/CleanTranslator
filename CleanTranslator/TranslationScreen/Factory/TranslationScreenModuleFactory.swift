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
        dataStore: TranslationScreenDataStoreProtocol,
        moduleOutput delegate: TranslationScreenModuleOutput?) -> TranslationScreenModule
}

final class MainTranslationScreenModuleFactory: TranslationScreenModuleFactory {
    
    // MARK: - Private properties
    
    private let alertFactory: AlertFactory
    private let service: TranslationService
    
    // MARK: - Init
    
    init(service: TranslationService, alertFactory: AlertFactory) {
        self.alertFactory = alertFactory
        self.service = service
    }
    
    // MARK: - Public methods

    func createModule(
        dataStore: TranslationScreenDataStoreProtocol,
        moduleOutput delegate: TranslationScreenModuleOutput?) -> TranslationScreenModule {
        
        // Worker Setup
        let worker = TranslationScreenWorker(dataStore: dataStore, service: service)
        
        // VIP Cycle Setup
        let presenter = TranslationScreenPresenter()
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        let viewController = TranslationScreenViewController(
            interactor: interactor,
            alertFactory: alertFactory)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return TranslationScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
