//  LanguageListScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля
protocol LanguageListScreenModuleOutput: AnyObject {
    func changeCurrentLanguage(_ languageCode: String)
}

/// Интерфейс внешнего обновления модуля
protocol LanguageListScreenUpdater {
    func updateList(_ laguages: [LanguageModel])
}

protocol LanguageListScreenBusinessLogic {
    func didRequestSelectLanguage(_ request: LanguageListScreenModels.UpdateLanguageList.Request)
}

final class LanguageListScreenInteractor: LanguageListScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: LanguageListScreenPresentationLogic
    private let dataStore: LanguageListScreenDataStoreProtocol
    
    // MARK: - Public properties

    weak var moduleOutput: LanguageListScreenModuleOutput?
    
    // MARK: - Init
    
    init(
        presenter: LanguageListScreenPresentationLogic,
        dataStore: LanguageListScreenDataStoreProtocol) {
        
        self.presenter = presenter
        self.dataStore = dataStore
    }

    // MARK: - Public Methods
    
    func didRequestSelectLanguage(_ request: LanguageListScreenModels.UpdateLanguageList.Request) {
        handleLanguageChange(request.languageCode)
    }

    // MARK: - Private Methods
    
    private func handleLanguageChange(_ languageCode: String) {
        moduleOutput?.changeCurrentLanguage(languageCode)
    }
}

// MARK: - LanguageListScreenUpdater

extension LanguageListScreenInteractor: LanguageListScreenUpdater {
    func updateList(_ laguages: [LanguageModel]) {
        presenter.presentLanguageList(LanguageListScreenModels.UpdateLanguageList.Response(languages: laguages))
    }
}
