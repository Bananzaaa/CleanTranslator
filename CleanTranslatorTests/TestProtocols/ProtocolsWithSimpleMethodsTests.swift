//
//  ProtocolsWithSimpleMethodsTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Mockingbird
import XCTest
@testable import CleanTranslator

final class ProtocolsWithSimpleMethodsTests: XCTestCase {
    
    var someMock: ProtocolsWithSimpleMethodsMock!
    
    override func setUpWithError() throws {
        someMock = mock(ProtocolsWithSimpleMethods.self)
    }
    
    override func tearDownWithError() throws {
        reset(type(of: mock(ProtocolsWithSimpleMethods.self)))
    }
    
    func testSimpleMethodThatReturns() throws {
        given(someMock.simpleMethodThatReturns()).willReturn(111)
                
        XCTAssertEqual(someMock.simpleMethodThatReturns(), 111)
        
        verify(someMock.simpleMethodThatReturns()).returning(Int.self).wasCalled()
        verify(someMock.simpleMethodThatReturns()).wasCalled(1)
    }
    
    func testSimpleMethodThatReturnsWithParams() throws {
        given(someMock.simpleMethodThatReturns(param: "AAA")).willReturn("test_A")
        given(someMock.simpleMethodThatReturns(param: "BBB")).willReturn("test_B")
        
        XCTAssertEqual(someMock.simpleMethodThatReturns(param: "AAA"), "test_A")
        XCTAssertEqual(someMock.simpleMethodThatReturns(param: "BBB"), "test_B")
        
        verify(someMock.simpleMethodThatReturns(param: "AAA")).wasCalled(once)
        verify(someMock.simpleMethodThatReturns(param: "BBB")).wasCalled(once)
        verify(someMock.simpleMethodThatReturns(param: any())).wasCalled(2)
    }
    
    func testSimpleMethodThatReturnsWithOptionalParams() throws {
        given(someMock.simpleMethodThatReturns(optionalParam: "test_nil")).willReturn(nil)
        given(someMock.simpleMethodThatReturns(optionalParam: nil)).willReturn(nil)
        given(someMock.simpleMethodThatReturns(optionalParam: "test")).willReturn("AAA")
        
        XCTAssertEqual(someMock.simpleMethodThatReturns(optionalParam: "test_nil"), nil)
        XCTAssertEqual(someMock.simpleMethodThatReturns(optionalParam: nil), nil)
        XCTAssertEqual(someMock.simpleMethodThatReturns(optionalParam: "test"), "AAA")
        
        verify(someMock.simpleMethodThatReturns(optionalParam: any())).wasCalled(atLeast(3))
        verify(someMock.simpleMethodThatReturns(optionalParam: "test_nil")).wasCalled(once)
        verify(someMock.simpleMethodThatReturns(optionalParam: "test")).wasCalled(1)
        verify(someMock.simpleMethodThatReturns(optionalParam: nil)).wasCalled()
    }
}
