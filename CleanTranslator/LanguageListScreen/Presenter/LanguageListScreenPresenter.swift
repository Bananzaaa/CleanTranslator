//  LanguageListScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol LanguageListScreenPresentationLogic: AnyObject {
    func setupScreen()
    func showLanguageList(_ response: LanguageListScreenModels.UpdateLanguageList.Response)
    func updateScreen(_ response: LanguageListScreenModels.UpdateScreen.Response)
    func showError(_ response: LanguageListScreenModels.Error.Response)
    func showLoading()
    func hideLoading()
}

final class LanguageListScreenPresenter: LanguageListScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: LanguageListScreenDisplayLogic?
    
    // MARK: - LanguageListScreenPresentationLogic
    
    func updateScreen(_ response: LanguageListScreenModels.UpdateScreen.Response) {
        viewController?.updateScreen(LanguageListScreenModels.UpdateScreen.ViewModel(
            title: "English -> \(response.languageName)",
            isEnabledNextButton: true))
    }
    
    func setupScreen() {
        viewController?.setupScreen(LanguageListScreenModels.Setup.ViewModel(
            title: "English ->",
            buttonTitle: "Next",
            isEnabledNextButton: false))
    }

    func showLanguageList(_ response: LanguageListScreenModels.UpdateLanguageList.Response) {
        let cellModels = response.languages.map {
            LanguageCellViewModel(name: $0.nativeLanguageName, languageCode: $0.language)
        }
        let sections = [LanguageSectionModel(content: cellModels)]
        
        viewController?.setSections(LanguageListScreenModels.UpdateLanguageList.ViewModel(sections: sections))
    }
    
    func showError(_ response: LanguageListScreenModels.Error.Response) {
        
    }
    
    func showLoading() {
        viewController?.showLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
}
