//
//  ProtocolWithGenericTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Mockingbird
import XCTest
@testable import CleanTranslator

final class ProtocolWithGenericTests: XCTestCase {
    
    var someMock: ProtocolWithGenericMock!
    
    override func setUpWithError() throws {
        someMock = mock(ProtocolWithGeneric.self)
    }
    
    override func tearDownWithError() throws {
        reset(type(of: mock(ProtocolWithGeneric.self)))
    }
    
    func testMethodWithGeneric() throws {
        given(someMock.methodWithGeneric(lhs: any(Int.self, of: 1), rhs: any(Int.self, of: 2))).willReturn(true)
        given(someMock.methodWithGeneric(lhs: any(String.self), rhs: any(String.self))).willReturn(false)
        
        XCTAssertEqual(someMock.methodWithGeneric(lhs: 1, rhs: 2), true)
        XCTAssertEqual(someMock.methodWithGeneric(lhs: "AAA", rhs: "BBB"), false)
        
        verify(someMock.methodWithGeneric(lhs: any(Int.self), rhs: any(Int.self))).wasCalled()
        verify(someMock.methodWithGeneric(lhs: any(String.self), rhs: any(String.self))).wasCalled()
    }
    
    func test() throws {
        given(someMock.methodWithGenericConstraint(param: any([Int].self))).willReturn(1)
        
        XCTAssertEqual(someMock.methodWithGenericConstraint(param: [1, 2, 3]), 1)
        
        verify(someMock.methodWithGenericConstraint(param: any([Int].self))).wasCalled()
        verify(someMock.methodWithGenericConstraint(param: [1, 2, 3])).wasCalled()
    }
}
