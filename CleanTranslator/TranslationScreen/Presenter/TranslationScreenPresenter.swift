//  TranslationScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

//sourcery: AutoMockable
protocol TranslationScreenPresentationLogic: AnyObject {
    func presentSetupScreen(_ response: TranslationScreenModels.Setup.Response)
    func presentTranslation(_ response: TranslationScreenModels.Update.Response)
    func presentError(_ response: TranslationScreenModels.Error.Response)
}

final class TranslationScreenPresenter: TranslationScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: TranslationScreenDisplayLogic?
    
    // MARK: - TranslationScreenPresentationLogic

    func presentTranslation(_ response: TranslationScreenModels.Update.Response) {
        let plainText = response.translations.joined(separator: " ")
        let viewModel = TranslationScreenModels.Update.ViewModel(
            translatedText: plainText,
            font: .systemFont(ofSize: 17, weight: .semibold))
        viewController?.displayTranslatedText(viewModel)
    }
    
    func presentSetupScreen(_ response: TranslationScreenModels.Setup.Response) {
        let viewModel = TranslationScreenModels.Setup.ViewModel(
            title: response.languageModelId,
            buttonTitle: "Translate, please!")
        viewController?.displaySetupScreen(with: viewModel)
    }
    
    func presentError(_ response: TranslationScreenModels.Error.Response) {
        viewController?.displayError(TranslationScreenModels.Error.ViewModel(
            message: response.message,
            okButtonTirle: "Ok"))
    }
}
