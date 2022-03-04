//  LanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol LanguageListScreenWorkerProtocol {
    var currentLanguageCode: String { get }
    var currentLanguageName: String { get }
    func changeCurrentLanguage(_ languageCode: String)
    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)
}

final class LanguageListScreenWorker: LanguageListScreenWorkerProtocol {

    // MARK: - Private Properties
    
    private var dataStore: LanguageListScreenDataStoreProtocol
    private let service: TranslationService

    // MARK: - Init
    
    init(
        dataStore: LanguageListScreenDataStoreProtocol,
        service: TranslationService) {
        
        self.service = service
        self.dataStore = dataStore
    }

    // MARK: - LanguageListScreenWorkerProtocol
    
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
