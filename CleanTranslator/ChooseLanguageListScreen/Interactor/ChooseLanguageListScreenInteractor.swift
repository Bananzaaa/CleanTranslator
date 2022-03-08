//  ChooseLanguageListScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля
protocol ChooseLanguageListScreenModuleOutput: AnyObject {
    func didChooseLanguage(_ languageModelId: String)
}
/// Интерфейс внешнего обновления модуля
protocol ChooseLanguageListScreenUpdater {
    
}

protocol ChooseLanguageListScreenBusinessLogic {
    func didLoad()
    func didRequestChooseLanguage()
}

final class ChooseLanguageListScreenInteractor: ChooseLanguageListScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: ChooseLanguageListScreenPresentationLogic
    private let worker: ChooseLanguageListScreenWorkerProtocol
    
    // MARK: - Public properties

    weak var moduleOutput: ChooseLanguageListScreenModuleOutput?
    var languageListUpdater: LanguageListScreenUpdater?
    
    // MARK: - Init
    
    init(presenter: ChooseLanguageListScreenPresentationLogic,
         worker: ChooseLanguageListScreenWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: - Public Methods
    
    func didLoad() {
        setupScreen()
        getLanguaheList()
    }
    
    func didRequestChooseLanguage() {
        moduleOutput?.didChooseLanguage(worker.currentLanguageCode)
    }

    // MARK: - Private Methods
    
    private func getLanguaheList() {
        presenter.showLoading()
        worker.getLanguageList { [weak self] result in
            self?.presenter.hideLoading()
            switch result {
            case .success(let languages):
                self?.handleLanguageList(languages)
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    private func setupScreen() {
        presenter.setupScreen()
    }
    
    private func handleLanguageList(_ languages: [LanguageModel]) {
        languageListUpdater?.updateList(languages)
    }
    
    private func handleError(_ error: Error) {
        presenter.showError(ChooseLanguageListScreenModels.Error.Response(errorDescription: error.localizedDescription))
    }
    
    private func handleLanguageChange(_ languageCode: String) {
        worker.changeCurrentLanguage(languageCode)
        presenter.updateScreen(ChooseLanguageListScreenModels.UpdateScreen.Response(languageName: worker.currentLanguageName))
    }
}

// MARK: - ChooseLanguageListScreenUpdater

extension ChooseLanguageListScreenInteractor: ChooseLanguageListScreenUpdater {
    
}

// MARK: - LanguageListScreenModuleOutput

extension ChooseLanguageListScreenInteractor: LanguageListScreenModuleOutput {
    func changeCurrentLanguage(_ languageCode: String) {
        worker.changeCurrentLanguage(languageCode)
        presenter.updateScreen(ChooseLanguageListScreenModels.UpdateScreen.Response(languageName: worker.currentLanguageName))
    }
}
