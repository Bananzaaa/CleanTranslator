//
//  TranslationScreenViewControllerTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

import Mockingbird
import XCTest
@testable import CleanTranslator

final class TranslationScreenViewControllerTests: XCTestCase {
    
    var view: TranslationScreenViewMock!
    var interactor: TranslationScreenBusinessLogicMock!
    var alertFactory: AlertFactoryMock!
    var viewCotroller: TranslationScreenViewController!
    
    override func setUpWithError() throws {
        view = mock(TranslationScreenView.self).initialize()
        interactor = mock(TranslationScreenBusinessLogic.self)
        alertFactory = mock(AlertFactory.self)
        
        viewCotroller = TranslationScreenViewController(
            interactor: interactor,
            alertFactory: alertFactory,
            mainView: view)
    }

    override func tearDownWithError() throws {
        reset(type(of: mock(TranslationScreenPresentationLogic.self)))
        reset(type(of: mock(TranslationScreenWorkerProtocol.self)))
    }
    
    func testDisplaySetupScreen() throws {
        given(view.setup(any())).willReturn()
        
        viewCotroller.displaySetupScreen(with: TranslationScreenModels.Setup.ViewModel(title: "AAA", buttonTitle: "BBB"))
        
        verify(view.setup(any())).wasCalled()
        verify(view.showTranslation(any())).wasNeverCalled()
    }
    
    func testDisplayTranslatedText() throws {
        given(view.showTranslation(any())).willReturn()
        
        viewCotroller.displayTranslatedText(TranslationScreenModels.Update.ViewModel(translatedText: "AAA", font: .systemFont(ofSize: 16)))
        
        verify(view.showTranslation(any())).wasCalled()
        verify(view.setup(any())).wasNeverCalled()
    }
    
    func testDisplayError() throws {
        given(alertFactory.createErrorAlert(message: "AAA")).willReturn(any())
        
        viewCotroller.displayError(TranslationScreenModels.Error.ViewModel(message: "AAA", okButtonTirle: "BBB"))
        
        verify(alertFactory.createErrorAlert(message: "AAA")).wasCalled()
        verify(view.showTranslation(any())).wasNeverCalled()
        verify(view.setup(any())).wasNeverCalled()
    }
}
