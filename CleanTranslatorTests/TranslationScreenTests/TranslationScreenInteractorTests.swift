//
//  TranslationScreenInteractorTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 07.04.2022.
//

import XCTest
import SwiftyMocky
@testable import CleanTranslator

final class TranslationScreenInteractorTests: XCTestCase {
    
    var presenter: TranslationScreenPresentationLogicMock!
    var worker: TranslationScreenWorkerProtocolMock!
    var interactor: TranslationScreenInteractor!
    
    override func setUpWithError() throws {
        presenter = TranslationScreenPresentationLogicMock()
        worker = TranslationScreenWorkerProtocolMock()
        interactor = TranslationScreenInteractor(presenter: presenter, worker: worker)
    }
        
    func testDidLoad() throws {
        Given(worker, .translationModelId(getter: "123"))
        
        interactor.didLoad()
                                
        Verify(presenter, .presentSetupScreen(.value(TranslationScreenModels.Setup.Response(languageModelId: "123"))))
        Verify(presenter, 1, .presentSetupScreen(.any))
    }
    
    func testDidRequestTranslateSuccess() throws {
        worker.perform(.translate(text: .any, completion: .any, perform: { text, completion in
            completion(.success([TranslationModel(from: TranslationAPIModel(translation: "test"))]))
        }))
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        presenter.verify(.presentTranslation(.value(TranslationScreenModels.Update.Response(translations: ["test"]))), count: 1)
        worker.verify(.translate(text: .any, completion: .any), count: .once)
    }
    
    func testDidRequestTranslateFailure() throws {
        Perform(worker, .translate(text: .any, completion: .any, perform: { text, completion in
            completion(.failure(TestError.unknown))
        }))
        
        interactor.didRequestTranslate(TranslationScreenModels.Update.Request(textToTranslate: "test"))
        
        Verify(presenter, .once, .presentError(.any(TranslationScreenModels.Error.Response.self)))
    }
}
