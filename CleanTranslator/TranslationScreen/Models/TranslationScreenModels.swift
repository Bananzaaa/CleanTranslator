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
    }

    // MARK: - Update Models

    enum Update {
        struct Request {
            let textToTranslate: String
        }
        
        struct Response {
            let translatedText: String
        }
    }
}
