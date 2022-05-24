//
//  ProtocolWithMethodThatThrowsTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

import Mockingbird
import XCTest
@testable import CleanTranslator

final class ProtocolWithMethodThatThrowsTests: XCTestCase {
    
    var someMock: ProtocolWithMethodThatThrowsMock!
    
    override func setUpWithError() throws {
        someMock = mock(ProtocolWithMethodThatThrows.self)
    }
    
    override func tearDownWithError() throws {
        reset(type(of: mock(ProtocolWithMethodThatThrows.self)))
    }
    
    func testMethodThatThrows() throws {
        given(someMock.methodThatThrows()).willThrow(TestError.unknown)

        XCTAssertThrowsError(try (someMock.methodThatThrows() as Void))
                
        verify(someMock.methodThatThrows()).wasCalled()
    }
    
    func testMethodThatReturnsAndThrows() throws {
        given(someMock.methodThatReturnsAndThrows(param: 1)).willThrow(TestError.unknown)
        given(someMock.methodThatReturnsAndThrows(param: 2)).willReturn(true)
        given(someMock.methodThatReturnsAndThrows(param: 3)).willReturn(false)
        
        XCTAssertThrowsError(try someMock.methodThatReturnsAndThrows(param: 1) as Bool)
        XCTAssertEqual(try someMock.methodThatReturnsAndThrows(param: 2), true)
        XCTAssertEqual(try someMock.methodThatReturnsAndThrows(param: 3), false)
        
        verify(someMock.methodThatReturnsAndThrows(param: any())).wasCalled(3)
        verify(someMock.methodThatReturnsAndThrows(param: 1)).wasCalled(once)
        verify(someMock.methodThatReturnsAndThrows(param: 2)).wasCalled(once)
        verify(someMock.methodThatReturnsAndThrows(param: 3)).wasCalled(once)
    }
}
