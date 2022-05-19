//
//  MockStubbingPolicyTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Nimble
import XCTest
import SwiftyMocky

final class MockStubbingPolicyTests: XCTestCase {
    
    // MARK: - Stubbing policy
    
    func testDefaultWrapPolicyOverOneElementSequence() {
        let mock = ProtocolsWithSimpleMethodsMock()

        Given(mock, .simpleMethodThatReturns(willReturn: 1))
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
    }

    func testDefaultWrapPolicyOverMultiElementSequence() {
        let mock = ProtocolsWithSimpleMethodsMock()

        Given(mock, .simpleMethodThatReturns(willReturn: 1,2,3))
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)
    }

    func testErrorsWrapPolicyOverMultiElementSequence() {
        let mock = ProtocolWithMethodThatThrowsMock()

        Given(mock, .methodThatThrows(willThrow: TestError.first, TestError.second, TestError.third))

        expect(try mock.methodThatThrows()).to(throwError(TestError.first))
        expect(try mock.methodThatThrows()).to(throwError(TestError.second))
        expect(try mock.methodThatThrows()).to(throwError(TestError.third))
        expect(try mock.methodThatThrows()).to(throwError(TestError.first))
        expect(try mock.methodThatThrows()).to(throwError(TestError.second))
        expect(try mock.methodThatThrows()).to(throwError(TestError.third))
        expect(try mock.methodThatThrows()).to(throwError(errorType: TestError.self))
        expect(try mock.methodThatThrows()).to(throwError(errorType: TestError.self))
        expect(try mock.methodThatThrows()).to(throwError(errorType: TestError.self))
    }

    func testErrorsAndValuesMix() {
        let mock = ProtocolWithMethodThatThrowsMock(sequencing: .inWritingOrder, stubbing: .drop)

        Given(mock, .methodThatReturnsAndThrows(param: .any, willThrow: TestError.first))
        Given(mock, .methodThatReturnsAndThrows(param: .any, willThrow: TestError.second))
        Given(mock, .methodThatReturnsAndThrows(param: .any, willThrow: TestError.third))
        Given(mock, .methodThatReturnsAndThrows(param: .any, willReturn: true), .wrap)

        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.first)
        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.second)
        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.third)
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 0))
        XCTAssertTrue((try? mock.methodThatReturnsAndThrows(param: 0)) ?? false)
        XCTAssertTrue((try? mock.methodThatReturnsAndThrows(param: 0)) ?? false)
        XCTAssertTrue((try? mock.methodThatReturnsAndThrows(param: 0)) ?? false)
    }

    func testErrorsAndValuesMixProduce() {
        let mock = ProtocolWithMethodThatThrowsMock(sequencing: .inWritingOrder, stubbing: .drop)

        Given(mock, .methodThatReturnsAndThrows(param: .any, willProduce: { make in
            make.throw(TestError.first)
            make.throw(TestError.second)
            make.throw(TestError.third)
            make.return(true)
            make.return(true)
            make.return(true)
            make.return(true)
        }))

        Given(mock, .methodThatReturnsAndThrows(param: 1, willProduce: { make in
            make.return(false)
        }), .wrap)

        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.first)
        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.second)
        XCTAssertThrowsError(try mock.methodThatReturnsAndThrows(param: 0), error: TestError.third)
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 0))
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 0))
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 0))
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 1))
        XCTAssertNoThrow(try mock.methodThatReturnsAndThrows(param: 1))
        expect(try mock.methodThatReturnsAndThrows(param: 1)).notTo(throwError())
    }

    func testDefaultPolicyWhenSetDrop() {
        let mock = ProtocolsWithSimpleMethodsMock()
        mock.stubbingPolicy = .drop

        Given(mock, .simpleMethodThatReturns(willReturn: 0,0,0,0,0))
        Given(mock, .simpleMethodThatReturns(willReturn: 1,2,3,4))
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 4)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        // Next call will fail tests, as are given are dropped
    }

    func testInlineSetPolicy() {
        let mock = ProtocolsWithSimpleMethodsMock()

        Given(mock, .simpleMethodThatReturns(willReturn: 0))
        Given(mock, .simpleMethodThatReturns(willReturn: 5,4,3,2,1), .drop)

        XCTAssertEqual(mock.simpleMethodThatReturns(), 5)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 4)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        // All subsequent calls will return 0, as it has wrap policy
    }

    func testMixedPolicy() {
        let mock = ProtocolsWithSimpleMethodsMock()

        Given(mock, .simpleMethodThatReturns(optionalParam: .any, willReturn: nil), .wrap)
        Given(mock, .simpleMethodThatReturns(optionalParam: nil, willReturn: "a","b"), .drop)
        Given(mock, .simpleMethodThatReturns(optionalParam: "z", willReturn: "z","z","z"), .drop)

        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), "a")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "q"), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), "b")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), nil)
    }
}
