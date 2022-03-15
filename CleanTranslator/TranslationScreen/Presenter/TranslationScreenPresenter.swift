//  TranslationScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenPresentationLogic: AnyObject {
    func setupScreen(_ response: TranslationScreenModels.Setup.Response)
    func showTranslation(_ response: TranslationScreenModels.Update.Response)
    func showError(_ response: TranslationScreenModels.Error.Response)
}

final class TranslationScreenPresenter: TranslationScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: TranslationScreenDisplayLogic?
    
    // MARK: - TranslationScreenPresentationLogic

    func showTranslation(_ response: TranslationScreenModels.Update.Response) {
        let plainText = response.translations.joined(separator: " ")
        let viewModel = TranslationScreenModels.Update.ViewModel(
            translatedText: plainText,
            font: .systemFont(ofSize: 17, weight: .semibold))
        viewController?.showTranslatedText(viewModel)
    }
    
    func setupScreen(_ response: TranslationScreenModels.Setup.Response) {
        let viewModel = TranslationScreenModels.Setup.ViewModel(
            title: response.languageModelId,
            buttonTitle: "Translate, please!")
        viewController?.setup(with: viewModel)
    }
    
    func showError(_ response: TranslationScreenModels.Error.Response) {
        viewController?.showError(TranslationScreenModels.Error.ViewModel(
            message: response.message,
            okButtonTirle: "Ok"))
    }
}
