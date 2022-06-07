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
    
    var viewController: TranslationScreenDisplayLogicMock!
    var presenter: TranslationScreenPresenter!
    
    override func setUpWithError() throws {
        viewController = TranslationScreenDisplayLogicMock()
        presenter = TranslationScreenPresenter()
        presenter.viewController = viewController
    }
    
    func testSetupScreen() throws {
        presenter.presentSetupScreen(TranslationScreenModels.Setup.Response(languageModelId: "1"))
        
        Verify(viewController, .once, .displaySetupScreen(with: .any(TranslationScreenModels.Setup.ViewModel.self)))
    }
    
    func testPresentTranslation() throws {
        presenter.presentTranslation(TranslationScreenModels.Update.Response(translations: ["test"]))
        
        Verify(viewController, 1, .displayTranslatedText(.any(TranslationScreenModels.Update.ViewModel.self)))
    }
    
    func testPresentError() throws {
        presenter.presentError(TranslationScreenModels.Error.Response(message: "error"))
        
        Verify(viewController, .displayError(.any(TranslationScreenModels.Error.ViewModel.self)))
    }
}
