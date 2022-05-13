//  TranslationScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

//sourcery: AutoMockable
protocol TranslationScreenWorkerProtocol {
    var translationModelId: String { get }
    func translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)
}

final class TranslationScreenWorker: TranslationScreenWorkerProtocol {

    // MARK: - Private properties
    
    private let dataStore: TranslationScreenDataStoreProtocol
    private let service: TranslationService

    // MARK: - Init
    
    init(
        dataStore: TranslationScreenDataStoreProtocol,
        service: TranslationService) {
        
        self.dataStore = dataStore
        self.service = service
    }
    
    // MARK: - TranslationScreenWorkerProtocol
    
    var translationModelId: String {
        dataStore.modelId
    }
    
    func translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void) {
        service.translate(with: TranslationRequestModel(
            text: [text],
            modelId: dataStore.modelId)) { result in

            switch result {
            case .success(let content):
                completion(.success(content.translations.map { TranslationModel(from: $0) }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
