//  LanguageListScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля
protocol LanguageListScreenModuleOutput: AnyObject {
    func didChooseLanguage(_ languageModelId: String)
}

/// Интерфейс внешнего обновления модуля
protocol LanguageListScreenUpdater { }

protocol LanguageListScreenBusinessLogic {
    func didLoad()
    func didRequestChooseLanguage()
    func didRequestSelectLanguage(_ request: LanguageListScreenModels.UpdateLanguageList.Request)
}

final class LanguageListScreenInteractor: LanguageListScreenBusinessLogic {
    
    // MARK: - Private properties
    
    private let presenter: LanguageListScreenPresentationLogic
    private let worker: LanguageListScreenWorkerProtocol
    
    // MARK: - Public properties

    weak var moduleOutput: LanguageListScreenModuleOutput?
    
    // MARK: - Init
    
    init(
        presenter: LanguageListScreenPresentationLogic,
        worker: LanguageListScreenWorkerProtocol) {
        
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
    
    func didRequestSelectLanguage(_ request: LanguageListScreenModels.UpdateLanguageList.Request) {
        handleLanguageChange(request.languageCode)
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
        presenter.showLanguageList(LanguageListScreenModels.UpdateLanguageList.Response(languages: languages))
    }
    
    private func handleError(_ error: Error) {
        presenter.showError(LanguageListScreenModels.Error.Response(errorDescription: error.localizedDescription))
    }
    
    private func handleLanguageChange(_ languageCode: String) {
        worker.changeCurrentLanguage(languageCode)
        presenter.updateScreen(LanguageListScreenModels.UpdateScreen.Response(languageName: worker.currentLanguageName))
    }
}

// MARK: - LanguageListScreenUpdater

extension LanguageListScreenInteractor: LanguageListScreenUpdater {
    
}
