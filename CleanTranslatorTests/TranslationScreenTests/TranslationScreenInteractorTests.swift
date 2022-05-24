//
//  TranslationScreenInteractorTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 23.05.2022.
//

import Mockingbird
import XCTest
@testable import CleanTranslator

final class TranslationScreenInteractorTests: XCTestCase {
    
    typealias TextType = String
    typealias CompletionType = ((Result<[TranslationModel], Error>) -> Void)
    
    var presenter: TranslationScreenPresentationLogicMock!
    var worker: TranslationScreenWorkerProtocolMock!
    var interactor: TranslationScreenInteractor!
    
    override func setUpWithError() throws {
        presenter = mock(TranslationScreenPresentationLogic.self)
        worker = mock(TranslationScreenWorkerProtocol.self)
        interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
    }

    override func tearDownWithError() throws {
        reset(type(of: mock(TranslationScreenPresentationLogic.self)))
        reset(type(of: mock(TranslationScreenWorkerProtocol.self)))
    }
    
    func testDidLoad() throws {
        given(worker.translationModelId).willReturn("123")

        interactor.didLoad()

        verify(presenter.presentSetupScreen(any())).wasCalled(once)
    }
    
    func testDidRequestTranslateSuccess() throws {
        given(worker.translate(
            text: "test",
            completion: any(CompletionType.self))
        ).will { (text: TextType, completion: CompletionType) -> Void in
            completion(.success([TranslationModel(from: TranslationAPIModel(translation: "test"))]))
        }
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        verify(presenter.presentTranslation(any())).wasCalled()
        verify(presenter.presentSetupScreen(any())).wasNeverCalled()
        verify(presenter.presentError(any())).wasCalled(0)
    }
    
    func testDidRequestTranslateFailure() throws {
        given(worker.translate(
            text: any(),
            completion: any(CompletionType.self))
        ) ~> { (text: TextType, completion: CompletionType) -> Void in
            completion(.failure(TestError.unknown))
        }
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        verify(presenter.presentSetupScreen(any())).wasNeverCalled()
        verify(presenter.presentTranslation(any())).wasCalled(never)
        verify(presenter.presentError(any())).wasCalled()
    }
}
