//
//  ProtocolWithPropertiesTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Mockingbird
import XCTest
@testable import CleanTranslator

final class ProtocolWithPropertiesTests: XCTestCase {
    
    var someMock: ProtocolWithPropertiesMock!
    
    override func setUpWithError() throws {
        someMock = mock(ProtocolWithProperties.self)
    }
    
    override func tearDownWithError() throws {
        reset(type(of: mock(ProtocolWithProperties.self)))
    }
    
    func testSomeGetSetProperty() throws {
        given(someMock.someGetProperty).willReturn("AAA")
        
        XCTAssertEqual(someMock.someGetProperty, "AAA")
        
        verify(someMock.someGetProperty).wasCalled(once)
    }
    
    func testSomeGetProperty() throws {
        given(someMock.someGetSetProperty).willReturn(111)
        
        XCTAssertEqual(someMock.someGetSetProperty, 111)
        
        verify(someMock.someGetSetProperty).wasCalled()
    }
}
