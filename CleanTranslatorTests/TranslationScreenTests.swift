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
    
    func testDidRequestTranslate() throws {
        let presenter = TranslationScreenPresentationLogicMock()
        let worker = TranslationScreenWorkerProtocolMock()
        worker.given(.translationModelId(getter: "123"))
//        Given(worker, .translationModelId(getter: "123"))
        
        let sut = TranslationScreenInteractor(presenter: presenter, worker: worker)
        sut.didLoad()
                        
        Verify(presenter, .presentSetupScreen(.value(TranslationScreenModels.Setup.Response(languageModelId: "123"))))
                
        Verify(presenter, 1, .presentSetupScreen(.any))
    }
    
    
    
}
