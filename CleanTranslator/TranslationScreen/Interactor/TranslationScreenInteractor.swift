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
    
    // MARK: - Methods for test
    
    func simpleMethodThatReturns() -> Int
    func simpleMethodThatReturns(param: String) -> String
    func simpleMethodThatReturns(optionalParam: String?) -> String?
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
        presenter.presentSetupScreen(TranslationScreenModels.Setup.Response(
            languageModelId: worker.translationModelId))
    }
    
    // MARK: - Methods for test
    
    func simpleMethodThatReturns() -> Int {
        2
    }
    
    func simpleMethodThatReturns(param: String) -> String {
        ""
    }
    
    func simpleMethodThatReturns(optionalParam: String?) -> String? {
        nil
    }

    // MARK: - Private Methods
    
    private func handleError(_ error: Error) {
        presenter.presentError(TranslationScreenModels.Error.Response(message: error.localizedDescription))
    }
    
    private func handleTranslation(_ translation: [TranslationModel]) {
        let translations = translation.map { $0.text }
        presenter.presentTranslation(TranslationScreenModels.Update.Response(translations: translations))
    }
}

// MARK: - TranslationScreenUpdater

extension TranslationScreenInteractor: TranslationScreenUpdater { }
