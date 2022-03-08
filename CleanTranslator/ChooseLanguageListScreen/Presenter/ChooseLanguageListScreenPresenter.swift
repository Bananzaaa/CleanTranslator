//  ChooseLanguageListScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import UIKit

protocol ChooseLanguageListScreenPresentationLogic: AnyObject {
    func setupScreen()
    func updateScreen(_ response: ChooseLanguageListScreenModels.UpdateScreen.Response)
    func showError(_ response: ChooseLanguageListScreenModels.Error.Response)
    func showLoading()
    func hideLoading()
}

final class ChooseLanguageListScreenPresenter: ChooseLanguageListScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: ChooseLanguageListScreenDisplayLogic?
    
    // MARK: - ChooseLanguageListScreenPresentationLogic

    func updateScreen(_ response: ChooseLanguageListScreenModels.UpdateScreen.Response) {
        viewController?.updateScreen(ChooseLanguageListScreenModels.UpdateScreen.ViewModel(
            title: "English -> \(response.languageName)",
            isEnabledNextButton: true))
    }
    
    func setupScreen() {
        viewController?.setupScreen(ChooseLanguageListScreenModels.Setup.ViewModel(
            title: "English ->",
            buttonTitle: "Next",
            isEnabledNextButton: false))
    }
    
    func showError(_ response: ChooseLanguageListScreenModels.Error.Response) {
        
    }
    
    func showLoading() {
        viewController?.showLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
}
