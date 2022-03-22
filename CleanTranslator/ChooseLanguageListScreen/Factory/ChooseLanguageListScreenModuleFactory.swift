//  ChooseLanguageListScreenModuleFactory.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

struct ChooseLanguageListScreenModule {
    var viewController: UIViewController
    var updater: ChooseLanguageListScreenUpdater?
}

protocol ChooseLanguageListScreenModuleFactory {
    func createModule(
        moduleOutput delegate: ChooseLanguageListScreenModuleOutput?
    ) -> ChooseLanguageListScreenModule
}

final class MainChooseLanguageListScreenModuleFactory: ChooseLanguageListScreenModuleFactory {
    
    // MARK: - Private properties
    
    private let languageListModuleFactory: LanguageListScreenModuleFactory
    private let service: TranslationService
    private let alertFactory: AlertFactory
    
    // MARK: - Init
    
    init(
        service: TranslationService,
        languageListModuleFactory: LanguageListScreenModuleFactory,
        alertFactory: AlertFactory) {
            
        self.languageListModuleFactory = languageListModuleFactory
        self.service = service
        self.alertFactory = alertFactory
    }
    
    // MARK: - Public methods

    func createModule(
        moduleOutput delegate: ChooseLanguageListScreenModuleOutput?
    ) -> ChooseLanguageListScreenModule {

        // Worker Setup
        let dataSource = ChooseLanguageListScreenDataStore()
        let worker = ChooseLanguageListScreenWorker(dataStore: dataSource, service: service)
        
        // VIP Cycle Setup
        let presenter = ChooseLanguageListScreenPresenter()
        let interactor = ChooseLanguageListScreenInteractor(
            presenter: presenter,
            worker: worker)
        
        // Sub VIP Module Setup
        let languageListModule = languageListModuleFactory.createModule(moduleOutput: interactor)
        
        interactor.languageListUpdater = languageListModule.updater
        
        let viewController = ChooseLanguageListScreenViewController(
            interactor: interactor,
            contentViewController: languageListModule.viewController,
            alertFactory: alertFactory)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return ChooseLanguageListScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
