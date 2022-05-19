//
//  TranslationScreenPresenterTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 19.05.2022.
//

import XCTest
import SwiftyMocky
@testable import CleanTranslator

final class TranslationScreenPresenterTests: XCTestCase {
    
    func testSetupScreen() throws {
        let viewController = TranslationScreenDisplayLogicMock()
        let presenter = TranslationScreenPresenter()
        presenter.viewController = viewController
        
        presenter.presentSetupScreen(TranslationScreenModels.Setup.Response(languageModelId: "1"))
        
        Verify(viewController, .once, .displaySetupScreen(with: .any(TranslationScreenModels.Setup.ViewModel.self)))
    }
    
    func testPresentTranslation() throws {
        let viewController = TranslationScreenDisplayLogicMock()
        let presenter = TranslationScreenPresenter()
        presenter.viewController = viewController
        
        presenter.presentTranslation(TranslationScreenModels.Update.Response(translations: ["test"]))
        
        Verify(viewController, 1, .displayTranslatedText(.any(TranslationScreenModels.Update.ViewModel.self)))
    }
    
    func testPresentError() throws {
        let viewController = TranslationScreenDisplayLogicMock()
        let presenter = TranslationScreenPresenter()
        presenter.viewController = viewController
        
        presenter.presentError(TranslationScreenModels.Error.Response(message: "error"))
        
        Verify(viewController, .displayError(.any(TranslationScreenModels.Error.ViewModel.self)))
    }
}
