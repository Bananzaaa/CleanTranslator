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
    
    // MARK: - Init
    
    init(languageListModuleFactory: LanguageListScreenModuleFactory) {
        self.languageListModuleFactory = languageListModuleFactory
    }
    
    // MARK: - Public methods

    func createModule(
        moduleOutput delegate: ChooseLanguageListScreenModuleOutput?
    ) -> ChooseLanguageListScreenModule {

        // Worker Setup
        let dataSource = ChooseLanguageListScreenDataStore()
        let service = ServicesAssemblyContainer.Services.translationService()
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
            contentViewController: languageListModule.viewController)
        presenter.viewController = viewController

        interactor.moduleOutput = delegate
        
        return ChooseLanguageListScreenModule(
            viewController: viewController,
            updater: interactor
        )
    }
}
