//  TranslationScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol TranslationScreenWorkerProtocol {
    func translate(text: String)
}

final class TranslationScreenWorker: TranslationScreenWorkerProtocol {

    // MARK: - Public Properties

    // MARK: - Private Properties
    
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

    // MARK: - Public Methods
    
    func translate(text: String) {
        service.translate(with: TranslationRequest(text: [text], modelId: dataStore.modelId))
    }
}
