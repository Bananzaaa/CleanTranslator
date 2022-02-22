//  TranslationScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля
protocol TranslationScreenModuleOutput: AnyObject {}

/// Интерфейс внешнего обновления модуля
protocol TranslationScreenUpdater {}

protocol TranslationScreenBusinessLogic {
    func translate(text: String)
}

final class TranslationScreenInteractor: TranslationScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: TranslationScreenPresentationLogic
    private let worker: TranslationScreenWorkerProtocol
    
    // MARK: - Public properties

    weak var moduleOutput: TranslationScreenModuleOutput?
    
    // MARK: - Init
    
    init(presenter: TranslationScreenPresentationLogic,
         worker: TranslationScreenWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: - Public Methods
    
    func translate(text: String) {
        worker.translate(text: text)
    }

    // MARK: - Private Methods
}

// MARK: - TranslationScreenUpdater

extension TranslationScreenInteractor: TranslationScreenUpdater { }
