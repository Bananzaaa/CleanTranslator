//  TranslationScreenModels.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

enum TranslationScreenModels {
    
    // MARK: - Setup Models
    
    enum Setup {
        struct ViewModel {
            let title: String
            let buttonTitle: String
        }
        
        struct Response: Equatable {
            let languageModelId: String
        }
    }

    // MARK: - Update Models

    enum Update {
        struct ViewModel {
            let translatedText: String
            let font: UIFont
        }
        
        struct Request {
            let textToTranslate: String
        }
        
        struct Response: Equatable {
            let translations: [String]
        }
    }
    
    enum Error {
        struct ViewModel {
            let message: String
            let okButtonTirle: String
        }
        
        struct Response {
            let message: String
        }
    }
}
