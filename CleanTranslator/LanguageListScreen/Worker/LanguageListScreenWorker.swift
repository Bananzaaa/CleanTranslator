//  LanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol LanguageListScreenWorkerProtocol {
    func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)
}

final class LanguageListScreenWorker: LanguageListScreenWorkerProtocol {

    // MARK: - Private Properties
    
    private let service: TranslationService

    // MARK: - Init
    
    init(service: TranslationService) {
        
        self.service = service
    }

    // MARK: - LanguageListScreenWorkerProtocol

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
