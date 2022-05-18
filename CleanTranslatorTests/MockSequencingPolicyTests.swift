//
//  MockSequencingPolicyTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import XCTest
import SwiftyMocky

final class MockSequencingPolicyTests: XCTestCase {
    
    func testMixedPolicyWhenInverted() {
        let mock = ProtocolsWithSimpleMethodsMock(sequencing: .inWritingOrder)

        Given(mock, .simpleMethodThatReturns(optionalParam: "z", willReturn: "z","z","z"), .drop)
        Given(mock, .simpleMethodThatReturns(optionalParam: nil, willReturn: "a","b"), .drop)
        Given(mock, .simpleMethodThatReturns(optionalParam: .any, willReturn: nil), .wrap)

        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), "a")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "q"), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), "b")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: nil), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), "z")
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "z"), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "h"), nil)
        XCTAssertEqual(mock.simpleMethodThatReturns(optionalParam: "r"), nil)
    }

    func testMixedPolicyJustDropping() {
        let mock = ProtocolsWithSimpleMethodsMock(sequencing: .inWritingOrder, stubbing: .drop)

        Given(mock, .simpleMethodThatReturns(willReturn: 1))
        Given(mock, .simpleMethodThatReturns(willReturn: 2))
        Given(mock, .simpleMethodThatReturns(willReturn: 3))
        Given(mock, .simpleMethodThatReturns(willReturn: 4))
        Given(mock, .simpleMethodThatReturns(willReturn: 5))
        Given(mock, .simpleMethodThatReturns(willReturn: 6))

        Given(mock, .simpleMethodThatReturns(willReturn: 0), .wrap)

        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 4)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 5)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 6)

        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 0)
    }

    func testSequencingPolicyChange() {
        let mock = ProtocolsWithSimpleMethodsMock(sequencing: .inWritingOrder, stubbing: .drop)

        Given(mock, .simpleMethodThatReturns(willReturn: 1))
        Given(mock, .simpleMethodThatReturns(willReturn: 2))
        Given(mock, .simpleMethodThatReturns(willReturn: 3))
        Given(mock, .simpleMethodThatReturns(willReturn: 4))
        Given(mock, .simpleMethodThatReturns(willReturn: 5))
        Given(mock, .simpleMethodThatReturns(willReturn: 6))

        XCTAssertEqual(mock.simpleMethodThatReturns(), 1)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 2)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 3)

        mock.sequencingPolicy = .lastWrittenResolvedFirst

        XCTAssertEqual(mock.simpleMethodThatReturns(), 6)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 5)
        XCTAssertEqual(mock.simpleMethodThatReturns(), 4)
    }
}
