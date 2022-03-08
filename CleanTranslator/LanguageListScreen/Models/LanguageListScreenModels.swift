//  LanguageListScreenModels.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

enum LanguageListScreenModels {
    
    // MARK: - Update Models
    
    enum UpdateLanguageList {
        struct ViewModel {
            let sections: [LanguageSectionModel]
        }
        struct Request {
            let languageCode: String
        }
        struct Response {
            let languages: [LanguageModel]
        }
    }
}
