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
            let isEnabledNextButton: Bool
        }
    }
    
    // MARK: - Update Models
    
    enum UpdateScreen {
        struct ViewModel {
            let title: String
            let isEnabledNextButton: Bool
        }
        struct Response {
            let languageName: String
        }
    }
    
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
    
    enum Error {
        struct Response {
            let errorDescription: String
        }
    }
}
