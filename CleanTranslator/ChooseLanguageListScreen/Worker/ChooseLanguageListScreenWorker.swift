//  ChooseLanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

protocol ChooseLanguageListScreenWorkerProtocol {
    var currentLanguageCode: String { get }
    var currentLanguageName: String { get }
    func changeCurrentLanguage(_ languageCode: String)
    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)
}

final class ChooseLanguageListScreenWorker: ChooseLanguageListScreenWorkerProtocol {

    // MARK: - Private Properties
    
    private var dataStore: ChooseLanguageListScreenDataStoreProtocol
    private let service: TranslationService

    // MARK: - Init
    
    init(
        dataStore: ChooseLanguageListScreenDataStoreProtocol,
        service: TranslationService) {
        
        self.service = service
        self.dataStore = dataStore
    }

    // MARK: - ChooseLanguageListScreenWorkerProtocol

    var currentLanguageCode: String {
        dataStore.currentLanguageCode
    }
    
    var currentLanguageName: String {
        dataStore.languages.first(where: { $0.language == currentLanguageCode })?.nativeLanguageName ?? ""
    }
    
    func changeCurrentLanguage(_ languageCode: String) {
        dataStore.currentLanguageCode = languageCode
    }

    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void) {
        service.getLanguageList { [weak self] result in
            switch result {
            case .success(let model):
                let languages = model.languages.map { LanguageModel(from: $0) }
                self?.dataStore.languages = languages
                completion(.success(languages))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
