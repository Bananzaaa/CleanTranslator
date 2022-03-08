//
//  LanguageListScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import Foundation

protocol LanguageListScreenDataStoreProtocol {
    var languages: [LanguageModel] { get set }
}

final class LanguageListScreenDataStore: LanguageListScreenDataStoreProtocol {
    
    // MARK: - LanguageListScreenDataStoreProtocol
        
    var languages: [LanguageModel] = []
}
