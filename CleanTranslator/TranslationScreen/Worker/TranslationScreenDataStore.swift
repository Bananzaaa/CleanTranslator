//  TranslationScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol TranslationScreenDataStoreProtocol {
    var modelId: String { get }
}

final class TranslationScreenDataStore: TranslationScreenDataStoreProtocol {
    
    private let fromLanguageId: String
    private let toLanguageId: String
    
    init(fromLanguageId: String, toLanguageId: String) {
        self.fromLanguageId = fromLanguageId
        self.toLanguageId = toLanguageId
    }
    
    // MARK: - TranslationScreenDataStoreProtocol
        
    
    var modelId: String {
        fromLanguageId + "-" + toLanguageId
    }
}
