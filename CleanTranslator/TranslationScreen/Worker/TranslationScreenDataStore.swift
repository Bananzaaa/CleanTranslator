//  TranslationScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

protocol TranslationScreenDataStoreProtocol {
    var modelId: String { get set }
}

final class TranslationScreenDataStore: TranslationScreenDataStoreProtocol {
    
    // MARK: - TranslationScreenDataStoreProtocol
    
    var modelId: String = "en-ru"
}
