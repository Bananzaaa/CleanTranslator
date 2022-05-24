//
//  ProtocolWithStaticTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Mockingbird
import XCTest
@testable import CleanTranslator

final class ProtocolWithStaticTests: XCTestCase {
    
    var someMock: ProtocolWithStaticMock.Type!
    
    override func setUpWithError() throws {
        someMock = type(of: mock(ProtocolWithStatic.self))
    }
    
    override func tearDownWithError() throws {
        reset(type(of: mock(ProtocolWithStatic.self)))
    }
    
    func testStaticProperty() throws {
        given(someMock.staticProperty).willReturn("AAA")
        
        XCTAssertEqual(someMock.staticProperty, "AAA")
        
        verify(someMock.staticProperty).wasCalled()
    }
    
    func testStaticMethod() throws {
        given(someMock.staticMethod(param: 1)).willReturn(2)
        
        XCTAssertEqual(try someMock.staticMethod(param: 1), 2)
        
        verify(someMock.staticMethod(param: 1)).wasCalled(once)
    }
    
    func testStaticMethodThrowError() throws {
        given(someMock.staticMethod(param: 0)).willThrow(TestError.unknown)
        
        XCTAssertThrowsError(try someMock.staticMethod(param: 0) as Int)
        
        verify(someMock.staticMethod(param: 0)).wasCalled(once)
    }
}
