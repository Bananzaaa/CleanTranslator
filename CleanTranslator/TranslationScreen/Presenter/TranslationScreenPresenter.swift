//  TranslationScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import UIKit

protocol TranslationScreenPresentationLogic: AnyObject {

}

final class TranslationScreenPresenter: TranslationScreenPresentationLogic {

    // MARK: - Public properties
    
    weak var viewController: TranslationScreenDisplayLogic?
    
    // MARK: - TranslationScreenPresentationLogic

}
