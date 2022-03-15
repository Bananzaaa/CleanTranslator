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
    func didRequestTranslate(_ request: TranslationScreenModels.Update.Request)
    func didLoad()
}

final class TranslationScreenInteractor: TranslationScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: TranslationScreenPresentationLogic
    private let worker: TranslationScreenWorkerProtocol
    
    // MARK: - Public properties
    
    weak var moduleOutput: TranslationScreenModuleOutput?
    
    // MARK: - Init
    
    init(
        presenter: TranslationScreenPresentationLogic,
        worker: TranslationScreenWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: - Public Methods
    
    func didRequestTranslate(_ request: TranslationScreenModels.Update.Request) {
        worker.translate(text: request.textToTranslate) { [weak self] result in
            switch result {
            case .success(let translation):
                self?.handleTranslation(translation)
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    func didLoad() {
        presenter.setupScreen(TranslationScreenModels.Setup.Response(
            languageModelId: worker.translationModelId))
    }

    // MARK: - Private Methods
    
    private func handleError(_ error: Error) {
        presenter.showError(TranslationScreenModels.Error.Response(message: error.localizedDescription))
    }
    
    private func handleTranslation(_ translation: [TranslationModel]) {
        let translations = translation.map { $0.text }
        presenter.showTranslation(TranslationScreenModels.Update.Response(translations: translations))
    }
}

// MARK: - TranslationScreenUpdater

extension TranslationScreenInteractor: TranslationScreenUpdater { }
