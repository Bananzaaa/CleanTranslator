//
//  LanguageListScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import Foundation

protocol LanguageListScreenDataStoreProtocol {
    var currentLanguageCode: String { get set }
    var languages: [LanguageModel] { get set }
}

final class LanguageListScreenDataStore: LanguageListScreenDataStoreProtocol {
    
    // MARK: - TranslationScreenDataStoreProtocol
    
    var currentLanguageCode: String = ""
    
    var languages: [LanguageModel] = []
}
