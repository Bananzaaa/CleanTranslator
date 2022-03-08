//  ChooseLanguageListScreenDataStore.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

protocol ChooseLanguageListScreenDataStoreProtocol {
    var currentLanguageCode: String { get set }
    var languages: [LanguageModel] { get set }
}

final class ChooseLanguageListScreenDataStore: ChooseLanguageListScreenDataStoreProtocol {
    
    // MARK: - ChooseLanguageListScreenDataStoreProtocol
        
    var currentLanguageCode: String = ""
    
    var languages: [LanguageModel] = []
}
