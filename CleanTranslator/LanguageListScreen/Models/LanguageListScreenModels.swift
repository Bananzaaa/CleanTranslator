//  LanguageListScreenModels.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

enum LanguageListScreenModels {
    
    // MARK: - Setup Models
    
    enum Setup {
        struct ViewModel {
            let title: String
            let buttonTitle: String
        }
    }
    
    // MARK: - Update Models
    
    enum UpdateLanguageList {
        struct ViewModel {
            let sections: [LanguageSectionModel]
        }
        struct Response {
            let languages: [LanguageModel]
        }
    }
    
    enum Error {
        struct Response {
            let errorDescription: String
        }
    }
}
