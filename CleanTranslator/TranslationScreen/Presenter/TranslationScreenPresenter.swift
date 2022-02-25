//  TranslationScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenPresentationLogic: AnyObject {
    func setupScreen(with viewModel: TranslationScreenModels.Setup.ViewModel)
    func showTranslation(_ response: TranslationScreenModels.Update.Response)
}

final class TranslationScreenPresenter: TranslationScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: TranslationScreenDisplayLogic?
    
    // MARK: - TranslationScreenPresentationLogic

    func showTranslation(_ response: TranslationScreenModels.Update.Response) {
        viewController?.showTranslatedText(response.translatedText)
    }
    
    func setupScreen(with viewModel: TranslationScreenModels.Setup.ViewModel) {
        viewController?.setup(with: viewModel)
    }
}
