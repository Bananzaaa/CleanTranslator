//
//  CleanTranslatorInteractorTests.swift
//  CleanTranslatorInteractorTests
//
//  Created by Stanislav Anatskii on 14.02.2022.
//

import Cuckoo
import XCTest
@testable import CleanTranslator

class CleanTranslatorInteractorTests: XCTestCase {

    func testDidLoad() throws {
        
        // Given
        
        let presenter = MockTranslationScreenPresentationLogic()
        let worker = MockTranslationScreenWorkerProtocol()
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        stub(worker) { mock in
            when(mock).translationModelId.get.thenReturn("123")
        }
        stub(presenter) { mock in
            when(mock).presentSetupScreen(any()).thenDoNothing()
        }
        
        // When
        
        interactor.didLoad()
        
        // Then
        
        verify(presenter, times(1)).presentSetupScreen(equal(to: TranslationScreenModels.Setup.Response(languageModelId: "123")))
        verify(presenter, never()).presentTranslation(any())
        verify(presenter, times(0)).presentError(any())
    }

    func testDidRequestTranslateSuccess() throws {
        let presenter = MockTranslationScreenPresentationLogic()
        let worker = MockTranslationScreenWorkerProtocol()
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        stub(worker) { mock in
            when(mock).translate(text: equal(to: "test"), completion: any()).then { text, completion in
                completion(.success([TranslationModel(from: TranslationAPIModel(translation: "text"))]))
            }
        }
        stub(presenter) { mock in
            when(mock).presentTranslation(any()).thenDoNothing()
        }
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        verify(presenter, times(1)).presentTranslation(any())
        verify(presenter, never()).presentSetupScreen(any())
        verify(presenter, never()).presentError(any())
    }
    
    func testDidRequestTranslateFailure() throws {
        let presenter = MockTranslationScreenPresentationLogic()
        let worker = MockTranslationScreenWorkerProtocol()
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        
        stub(worker) { mock in
            when(mock).translate(text: equal(to: "111"), completion: any()).then { text, completion in
                completion(.failure(TestError.unknown))
            }
        }
        
        stub(presenter) { mock in
            when(mock).presentError(any()).thenDoNothing()
        }
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "111"))
        
        verify(presenter, atLeastOnce()).presentError(any())
    }
}
