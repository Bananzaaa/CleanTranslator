//  LanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol LanguageListScreenWorkerProtocol {
    var languageModelId: String { get }
    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)
}

final class LanguageListScreenWorker: LanguageListScreenWorkerProtocol {

    // MARK: - Private Properties
    
    private let dataStore: LanguageListScreenDataStoreProtocol
    private let service: TranslationService

    // MARK: - Init
    
    init(
        dataStore: LanguageListScreenDataStoreProtocol,
        service: TranslationService) {
        
        self.service = service
        self.dataStore = dataStore
    }

    // MARK: - LanguageListScreenWorkerProtocol
    
    var languageModelId: String {
        dataStore.languageModelId
    }

    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void) {
        service.getLanguageList { result in
            switch result {
            case .success(let model):
                completion(.success(model.languages.map { LanguageModel(from: $0) }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
