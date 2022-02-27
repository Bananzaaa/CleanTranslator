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
    func showError(_ response: LanguageListScreenModels.Error.Response)
    func showLoading()
    func hideLoading()
}

final class LanguageListScreenPresenter: LanguageListScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: LanguageListScreenDisplayLogic?
    
    // MARK: - LanguageListScreenPresentationLogic
    
    func setupScreen() {
        viewController?.setupScreen(LanguageListScreenModels.Setup.ViewModel(
            title: "En -> Ru",
            buttonTitle: "Next"))
    }

    func showLanguageList(_ response: LanguageListScreenModels.UpdateLanguageList.Response) {
        let cellModels = response.languages.map {
            LanguageCellViewModel(name: $0.languageName, countryCode: $0.countryCode)
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
