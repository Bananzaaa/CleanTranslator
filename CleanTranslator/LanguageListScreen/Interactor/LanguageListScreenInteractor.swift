//  LanguageListScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля
protocol LanguageListScreenModuleOutput: AnyObject {}

/// Интерфейс внешнего обновления модуля
protocol LanguageListScreenUpdater { }

protocol LanguageListScreenBusinessLogic {
    
}

final class LanguageListScreenInteractor: LanguageListScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: LanguageListScreenPresentationLogic
    private let worker: LanguageListScreenWorkerProtocol
    
    // MARK: - Public properties

    weak var moduleOutput: LanguageListScreenModuleOutput?
    
    // MARK: - Init
    
    init(presenter: LanguageListScreenPresentationLogic,
         worker: LanguageListScreenWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: - Public Methods

    // MARK: - Private Methods
}

// MARK: - LanguageListScreenUpdater

extension LanguageListScreenInteractor: LanguageListScreenUpdater { }
