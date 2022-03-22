//  ChooseLanguageListScreenModels.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

enum ChooseLanguageListScreenModels {
    
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
    
    enum Error {
        struct ViewModel {
            let message: String
            let okButtonTirle: String
        }
        struct Response {
            let errorDescription: String
        }
    }
}
