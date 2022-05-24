//
//  TranslationScreenPresenterTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

import Mockingbird
import XCTest
@testable import CleanTranslator

final class TranslationScreenPresenterTests: XCTestCase {
    
    var viewController: TranslationScreenDisplayLogicMock!
    var presenter: TranslationScreenPresenter!
    
    override func setUpWithError() throws {
        viewController = mock(TranslationScreenDisplayLogic.self)
        presenter = TranslationScreenPresenter()
        presenter.viewController = viewController
    }

    override func tearDownWithError() throws {
        reset(type(of: mock(TranslationScreenDisplayLogic.self)))
    }
    
    func testPresentSetupScreen() throws {
        given(viewController.displaySetupScreen(with: any())).willReturn()
        
        presenter.presentSetupScreen(TranslationScreenModels.Setup.Response(languageModelId: "123"))
        
        verify(viewController.displaySetupScreen(with: any())).wasCalled()
        verify(viewController.displayTranslatedText(any())).wasNeverCalled()
        verify(viewController.displayError(any())).wasNeverCalled()
    }
    
    func testPresentTranslation() throws {
        given(viewController.displayTranslatedText(any())).willReturn()
        
        presenter.presentTranslation(TranslationScreenModels.Update.Response(translations: ["AAA"]))
        
        verify(viewController.displayTranslatedText(any())).wasCalled()
        verify(viewController.displaySetupScreen(with: any())).wasNeverCalled()
        verify(viewController.displayError(any())).wasNeverCalled()
    }
    
    func testPresentError() throws {
        given(viewController.displayError(any())).willReturn()
        
        presenter.presentError(TranslationScreenModels.Error.Response(message: "AAA"))
        
        verify(viewController.displayError(any())).wasCalled()
        verify(viewController.displayTranslatedText(any())).wasNeverCalled()
        verify(viewController.displaySetupScreen(with: any())).wasNeverCalled()
    }
}
