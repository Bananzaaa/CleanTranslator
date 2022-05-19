//
//  TranslationScreenTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 07.04.2022.
//

import XCTest
import SwiftyMocky
@testable import CleanTranslator

final class TranslationScreenTests: XCTestCase {
        
    func testDidLoad() throws {
        let presenter = TranslationScreenPresentationLogicMock()
        let worker = TranslationScreenWorkerProtocolMock()
        Given(worker, .translationModelId(getter: "123"))
                
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        interactor.didLoad()
                                
        Verify(presenter, .presentSetupScreen(.value(TranslationScreenModels.Setup.Response(languageModelId: "123"))))
        Verify(presenter, 1, .presentSetupScreen(.any))
    }
    
    func testDidRequestTranslateSuccess() throws {
        let presenter = TranslationScreenPresentationLogicMock()
        let worker = TranslationScreenWorkerProtocolMock()
        worker.perform(.translate(text: .any, completion: .any, perform: { text, completion in
            completion(.success([TranslationModel(from: TranslationAPIModel(translation: "test"))]))
        }))
        
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        presenter.verify(.presentTranslation(.value(TranslationScreenModels.Update.Response(translations: ["test"]))), count: 1)
    }
    
    func testDidRequestTranslateFailure() throws {
        let presenter = TranslationScreenPresentationLogicMock()
        let worker = TranslationScreenWorkerProtocolMock()
        
        Perform(worker, .translate(text: .any, completion: .any, perform: { text, completion in
            completion(.failure(TestError.unknown))
        }))
        
        let interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        Verify(presenter, 1, .presentError(.any))
    }
}
