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
    
    func translate(text: String) {
        worker.translate(text: text) { [weak self] result in
            switch result {
            case .success(let translation):
                self?.showTranslation(translation)
            case .failure(let error):
                self?.showError(error)
            }
        }
    }
    
    func didLoad() {
        presenter.setupScreen(with: TranslationScreenModels.Setup.ViewModel(
            title: worker.tarnslationModelId,
            buttonTitle: "Translate, please!"))
    }

    // MARK: - Private Methods
    
    private func showError(_ error: Error) {
        
    }
    
    private func showTranslation(_ translation: [TranslationModel]) {
        let plainText = translation.map { $0.text }.joined(separator: " ")
        presenter.showTranslation(TranslationScreenModels.Update.Response(translatedText: plainText))
    }
}

// MARK: - TranslationScreenUpdater

extension TranslationScreenInteractor: TranslationScreenUpdater { }
