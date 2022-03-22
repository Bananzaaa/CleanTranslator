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
    func presentError(_ response: ChooseLanguageListScreenModels.Error.Response)
    func presentLoading()
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
    
    func presentError(_ response: ChooseLanguageListScreenModels.Error.Response) {
        viewController?.displayError(ChooseLanguageListScreenModels.Error.ViewModel(
            message: response.errorDescription,
            okButtonTirle: "Ok"))
    }
    
    func presentLoading() {
        viewController?.displayLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
}
