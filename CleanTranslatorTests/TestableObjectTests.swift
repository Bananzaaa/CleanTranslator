//
//  TestableObjectTests.swift
//  CleanTranslatorTests
//
//  Created by Stanislav Anatskii on 17.05.2022.
//

import Nimble
import XCTest
import SwiftyMocky
@testable import CleanTranslator

final class TestableObjectTests: XCTestCase {
    
    // MARK: - Tests simple methods
    
    func testSimpleMethodThatReturns() throws {
        let mock = ProtocolsWithSimpleMethodsMock()
        Given(mock, .simpleMethodThatReturns(willReturn: 111))
        
        mock.verify(.simpleMethodThatReturns(), count: 0)
        
        expect(mock.simpleMethodThatReturns()).to(equal(111))
        
        Verify(mock, 1, .simpleMethodThatReturns())
    }

    func testSimpleMethodThatReturnsWithParams() throws {
        let mock = ProtocolsWithSimpleMethodsMock()
        let testInput = "test_input"
        Given(mock, .simpleMethodThatReturns(param: .value(testInput), willReturn: "test_output"))
        
        Verify(mock, 0, .simpleMethodThatReturns(param: .any))
        
        expect(mock.simpleMethodThatReturns(param: testInput)).to(equal("test_output"))
        
        Verify(mock, 1, .simpleMethodThatReturns(param: .any))
        
        _ = mock.simpleMethodThatReturns(param: testInput)
        _ = mock.simpleMethodThatReturns(param: testInput)
        
        Verify(mock, .more(than: 2), .simpleMethodThatReturns(param: .any))
    }
    
    func testSimpleMethodWithOptionalParamThatReturns() throws {
        let mock = ProtocolsWithSimpleMethodsMock()
        mock.matcher.register(Optional<String>.self) { $0 == $1 }
        
        let input = "input"
        let output = "output"
        
        mock.given(.simpleMethodThatReturns(optionalParam: .value(nil), willReturn: nil))
        
        expect(mock.simpleMethodThatReturns(optionalParam: nil)).to(beNil())
        
        Given(mock, .simpleMethodThatReturns(optionalParam: .value(input), willReturn: output), .drop)
        Given(mock, .simpleMethodThatReturns(optionalParam: nil, willReturn: output), .drop)
        
        expect(mock.simpleMethodThatReturns(optionalParam: nil)) != nil
        expect(mock.simpleMethodThatReturns(optionalParam: input)).to(equal(output))
        
        Verify(mock, .atLeastOnce, .simpleMethodThatReturns(optionalParam: .value(input)))
        Verify(mock, 2, .simpleMethodThatReturns(optionalParam: nil))
        Verify(mock, 2, .simpleMethodThatReturns(optionalParam: .value(nil)))
        Verify(mock, 3, .simpleMethodThatReturns(optionalParam: .any))
        Verify(mock, .moreOrEqual(to: 2), .simpleMethodThatReturns(optionalParam: .any))
    }
    
    // MARK: - Tests properties
    
    func testGetSetSomeProperty() throws {
        let mock = ProtocolWithPropertiesMock()
        mock.someGetSetProperty = 5
        
        XCTAssertEqual(mock.someGetSetProperty, 5)
        mock.verify(.someGetSetProperty, count: 1)
        Verify(mock, .atLeastOnce, .someGetSetProperty(set: .value(5)))
    }
    
    func testGetSomeProperty() throws {
        let mock = ProtocolWithPropertiesMock()
        mock.given(.someGetProperty(getter: "test"))
        
        XCTAssertEqual(mock.someGetProperty, "test")
        _ = mock.someGetProperty
        _ = mock.someGetProperty
        
        Verify(mock, 3, .someGetProperty)
    }
    
    // MARK: - Tests WillProduce
    
    func testMethodThatTakesTupleWillProduce() throws {
        let mock = ProtocolWithTuplesMock()
        mock.matcher.register((String,Int).self) { lhs, rhs in
            lhs.0 == rhs.0 && lhs.1 == rhs.1
        }
        mock.given(.methodThatTakesTuple(tuple: .any, willProduce: { stabber in
            stabber.return(5)
        }))
        
        expect(mock.methodThatTakesTuple(tuple: ("test", 3))).to(equal(5))
        
        Verify(mock, .atLeastOnce, .methodThatTakesTuple(tuple: .any))
    }
    
    // MARK: - Tests methods that throws
    
    func testMethodThatThrows() throws {
        let mock = ProtocolWithMethodThatThrowsMock()
        mock.given(.methodThatThrows(willThrow: TestError.unknown))
        
        expect(try mock.methodThatThrows()).toAlways(throwError(TestError.unknown))
        
        Verify(mock, .atLeastOnce, .methodThatThrows())
    }
    
    func testMethodThatReturnsAndThrows() throws {
        let mock = ProtocolWithMethodThatThrowsMock()
        mock.given(.methodThatReturnsAndThrows(param: .value(404), willThrow: TestError.unknown))
        mock.given(.methodThatReturnsAndThrows(param: .value(200), willReturn: true))
        mock.given(.methodThatReturnsAndThrows(param: .value(500), willReturn: false))
        
        expect(try mock.methodThatReturnsAndThrows(param: 200)).to(beTrue())
        expect(try mock.methodThatReturnsAndThrows(param: 500)).to(beFalse())
        expect(try mock.methodThatReturnsAndThrows(param: 404)).to(throwError())
        
        Verify(mock, 3, .methodThatReturnsAndThrows(param: .any))
        Verify(mock, 1, .methodThatReturnsAndThrows(param: .value(404)))
        Verify(mock, 1, .methodThatReturnsAndThrows(param: .value(200)))
        Verify(mock, 1, .methodThatReturnsAndThrows(param: .value(500)))
    }
    
    // MARK: - Tests custom object
    
    func testMethodThatTakesUser() throws {
        let mock = ProtocolWithCustomObjectMock()
        let user = UserObject(name: "Alex", surname: "Ivanov", age: 24)
        // if UserObject not confirm to Equatable
        Matcher.default.register(UserObject.self) { (lhs: UserObject, rhs: UserObject) -> Bool in
            lhs.name == rhs.name && lhs.surname == rhs.surname && lhs.age == rhs.age
        }
        Given(mock, .methodThatTakesUser(user: .value(user), willThrow: TestError.unknown))
        
        expect(try mock.methodThatTakesUser(user: user)).to(throwError(TestError.unknown))
        
        Verify(mock, .atLeastOnce, .methodThatTakesUser(user: .value(user)))
    }
    
    func testMethodThatTakesArrayOfUsers() throws {
        let mock = ProtocolWithCustomObjectMock()
        let users = [UserObject(name: "Alex", surname: "Ivanov", age: 24)]
        // if UserObject not confirm to Equatable => using .any
        Given(mock, .methodThatTakesArrayOfUsers(array: .any, willReturn: 1))

        expect(mock.methodThatTakesArrayOfUsers(array: users)).to(beGreaterThan(0))
        
        Verify(mock, 1, .methodThatTakesArrayOfUsers(array: .any([UserObject].self)))
    }
    
    // MARK: - Tests static properties and static methods
    
    func testStaticProperty() throws {
        Given(ProtocolWithStaticMock.self, .staticProperty(getter: "value"))
        
        XCTAssertEqual(ProtocolWithStaticMock.staticProperty, "value")
        
        Verify(ProtocolWithStaticMock.self, 1, .staticProperty)
    }
    
    func testStaticMethod() throws {
        Given(ProtocolWithStaticMock.self, .staticMethod(param: .value(0), willReturn: 1))
        Given(ProtocolWithStaticMock.self, .staticMethod(param: .value(1), willReturn: 2))
        Given(ProtocolWithStaticMock.self, .staticMethod(param: .any, willThrow: TestError.unknown))
        
        XCTAssertEqual(try ProtocolWithStaticMock.staticMethod(param: 0), 1)
        XCTAssertEqual(try ProtocolWithStaticMock.staticMethod(param: 1), 2)
        XCTAssertThrowsError(try ProtocolWithStaticMock.staticMethod(param: 3))
        
        Verify(ProtocolWithStaticMock.self, 1, .staticMethod(param: .value(0)))
        Verify(ProtocolWithStaticMock.self, 1, .staticMethod(param: .value(1)))
        Verify(ProtocolWithStaticMock.self, .moreOrEqual(to: 3), .staticMethod(param: .any))
    }
    
    // MARK: - Tests method with generics
    
    func testMethodWithGeneric() throws {
        let mock = ProtocolWithGenericMock()
        Given(mock, .methodWithGeneric(lhs: .any(Int.self), rhs: .any(Int.self), willReturn: false))
        Given(mock, .methodWithGeneric(lhs: .any(String.self), rhs: .any(String.self), willReturn: true))
        
        XCTAssertFalse(mock.methodWithGeneric(lhs: 1, rhs: 2))
        XCTAssertTrue(mock.methodWithGeneric(lhs: "value_1", rhs: "value_2"))
        
        Verify(mock, 1, .methodWithGeneric(lhs: .any(Int.self), rhs: .any(Int.self)))
        Verify(mock, .methodWithGeneric(lhs: .any(String.self), rhs: .any(String.self)))
    }
    
    // MARK: - Tests protocols with associated types
    
    func testProtocolWithAssociatedType() throws {
        let mock = ProtocolWithAssociatedTypeMock<[Int]>()
        mock.given(.sequence(getter: [1, 2, 3]))
        mock.given(.methodWithType(t: .value([2, 3, 4]), willReturn: true))
        
        XCTAssertEqual(mock.sequence, [1, 2, 3])
        XCTAssertTrue(mock.methodWithType(t: [2, 3, 4]))
    }
}
