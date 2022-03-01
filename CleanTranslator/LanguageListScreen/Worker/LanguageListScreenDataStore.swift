//
//  LanguageListScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import Foundation

protocol LanguageListScreenDataStoreProtocol {
    var languageModelId: String { get set }
}

final class LanguageListScreenDataStore: LanguageListScreenDataStoreProtocol {
    
    // MARK: - TranslationScreenDataStoreProtocol
    
    var languageModelId: String = "en-ru"
}
