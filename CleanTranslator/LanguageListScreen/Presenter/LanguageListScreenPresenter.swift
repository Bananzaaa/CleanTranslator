//  LanguageListScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenPresentationLogic: AnyObject {
    func presentLanguageList(_ response: LanguageListScreenModels.UpdateLanguageList.Response)
}

final class LanguageListScreenPresenter: LanguageListScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: LanguageListScreenDisplayLogic?
    
    // MARK: - LanguageListScreenPresentationLogic
    
    func presentLanguageList(_ response: LanguageListScreenModels.UpdateLanguageList.Response) {
        let cellModels = response.languages.map {
            LanguageCellViewModel(name: $0.nativeLanguageName, languageCode: $0.language)
        }
        let sections = [LanguageSectionModel(content: cellModels)]
        
        viewController?.setSections(LanguageListScreenModels.UpdateLanguageList.ViewModel(sections: sections))
    }
    
    
}
