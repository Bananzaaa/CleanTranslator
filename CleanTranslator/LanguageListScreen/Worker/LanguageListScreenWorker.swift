//  LanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol LanguageListScreenWorkerProtocol {
    
}

final class LanguageListScreenWorker: LanguageListScreenWorkerProtocol {

    // MARK: - Public Properties

    // MARK: - Private Properties
    
    private let dataStore: LanguageListScreenDataStoreProtocol
    private let service: LanguageListScreenServiceProtocol

    // MARK: - Init
    
    init(
        dataStore: LanguageListScreenDataStoreProtocol,
        service: LanguageListScreenServiceProtocol) {
        
        self.dataStore = dataStore
        self.service = service
    }

    // MARK: - LanguageListScreenWorkerProtocol

    // MARK: - Public Methods
}
