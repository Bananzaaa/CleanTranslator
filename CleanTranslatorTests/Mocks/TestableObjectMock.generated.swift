// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
import UIKit
@testable import CleanTranslator


// MARK: - ProtocolWithAssociatedType

open class ProtocolWithAssociatedTypeMock<T: Sequence>: ProtocolWithAssociatedType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var sequence: T {
		get {	invocations.append(.p_sequence_get); return __p_sequence ?? givenGetterValue(.p_sequence_get, "ProtocolWithAssociatedTypeMock - stub value for sequence was not defined") }
	}
	private var __p_sequence: (T)?





    open func methodWithType(t: T) -> Bool {
        addInvocation(.m_methodWithType__t_t(Parameter<T>.value(`t`)))
		let perform = methodPerformValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))) as? (T) -> Void
		perform?(`t`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithType(t: T). Use given")
			Failure("Stub return value not specified for methodWithType(t: T). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithType__t_t(Parameter<T>)
        case p_sequence_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_methodWithType__t_t(let lhsT), .m_methodWithType__t_t(let rhsT)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsT, rhs: rhsT, with: matcher), lhsT, rhsT, "t"))
				return Matcher.ComparisonResult(results)
            case (.p_sequence_get,.p_sequence_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithType__t_t(p0): return p0.intValue
            case .p_sequence_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_methodWithType__t_t: return ".methodWithType(t:)"
            case .p_sequence_get: return "[get] .sequence"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func sequence(getter defaultValue: T...) -> PropertyStub {
            return Given(method: .p_sequence_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func methodWithType(t: Parameter<T>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithType(t: Parameter<T>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithType(t: Parameter<T>) -> Verify { return Verify(method: .m_methodWithType__t_t(`t`))}
        public static var sequence: Verify { return Verify(method: .p_sequence_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithType(t: Parameter<T>, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_methodWithType__t_t(`t`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolWithCustomObject

open class ProtocolWithCustomObjectMock: ProtocolWithCustomObject, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func methodThatTakesUser(user: UserObject) throws {
        addInvocation(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`)))
		let perform = methodPerformValue(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`))) as? (UserObject) -> Void
		perform?(`user`)
		do {
		    _ = try methodReturnValue(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func methodThatTakesArrayOfUsers(array: [UserObject]) -> Int {
        addInvocation(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`)))
		let perform = methodPerformValue(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`))) as? ([UserObject]) -> Void
		perform?(`array`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodThatTakesArrayOfUsers(array: [UserObject]). Use given")
			Failure("Stub return value not specified for methodThatTakesArrayOfUsers(array: [UserObject]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatTakesUser__user_user(Parameter<UserObject>)
        case m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_methodThatTakesUser__user_user(let lhsUser), .m_methodThatTakesUser__user_user(let rhsUser)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher), lhsUser, rhsUser, "user"))
				return Matcher.ComparisonResult(results)

            case (.m_methodThatTakesArrayOfUsers__array_array(let lhsArray), .m_methodThatTakesArrayOfUsers__array_array(let rhsArray)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsArray, rhs: rhsArray, with: matcher), lhsArray, rhsArray, "array"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodThatTakesUser__user_user(p0): return p0.intValue
            case let .m_methodThatTakesArrayOfUsers__array_array(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_methodThatTakesUser__user_user: return ".methodThatTakesUser(user:)"
            case .m_methodThatTakesArrayOfUsers__array_array: return ".methodThatTakesArrayOfUsers(array:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatTakesUser(user: Parameter<UserObject>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatTakesUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatTakesUser(user: Parameter<UserObject>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatTakesUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatTakesUser(user: Parameter<UserObject>) -> Verify { return Verify(method: .m_methodThatTakesUser__user_user(`user`))}
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>) -> Verify { return Verify(method: .m_methodThatTakesArrayOfUsers__array_array(`array`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatTakesUser(user: Parameter<UserObject>, perform: @escaping (UserObject) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesUser__user_user(`user`), performs: perform)
        }
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, perform: @escaping ([UserObject]) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolWithGeneric

open class ProtocolWithGenericMock: ProtocolWithGeneric, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func methodWithGeneric<T>(lhs: T, rhs: T) -> Bool {
        addInvocation(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric())) as? (T, T) -> Void
		perform?(`lhs`, `rhs`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithGeneric<T>(lhs: T, rhs: T). Use given")
			Failure("Stub return value not specified for methodWithGeneric<T>(lhs: T, rhs: T). Use given")
		}
		return __value
    }

    open func methodWithGenericConstraint<U>(param: [U]) -> U where U: Equatable {
        addInvocation(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric())) as? ([U]) -> Void
		perform?(`param`)
		var __value: U
		do {
		    __value = try methodReturnValue(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithGenericConstraint<U>(param: [U]). Use given")
			Failure("Stub return value not specified for methodWithGenericConstraint<U>(param: [U]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<GenericAttribute>, Parameter<GenericAttribute>)
        case m_methodWithGenericConstraint__param_param(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_methodWithGeneric__lhs_lhsrhs_rhs(let lhsLhs, let lhsRhs), .m_methodWithGeneric__lhs_lhsrhs_rhs(let rhsLhs, let rhsRhs)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLhs, rhs: rhsLhs, with: matcher), lhsLhs, rhsLhs, "lhs"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRhs, rhs: rhsRhs, with: matcher), lhsRhs, rhsRhs, "rhs"))
				return Matcher.ComparisonResult(results)

            case (.m_methodWithGenericConstraint__param_param(let lhsParam), .m_methodWithGenericConstraint__param_param(let rhsParam)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher), lhsParam, rhsParam, "param"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithGeneric__lhs_lhsrhs_rhs(p0, p1): return p0.intValue + p1.intValue
            case let .m_methodWithGenericConstraint__param_param(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_methodWithGeneric__lhs_lhsrhs_rhs: return ".methodWithGeneric(lhs:rhs:)"
            case .m_methodWithGenericConstraint__param_param: return ".methodWithGenericConstraint(param:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, willReturn: U...) -> MethodStub where U: Equatable {
            return Given(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, willProduce: (Stubber<U>) -> Void) -> MethodStub where U: Equatable {
            let willReturn: [U] = []
			let given: Given = { return Given(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (U).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>) -> Verify { return Verify(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()))}
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>) -> Verify { return Verify(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, perform: @escaping (T, T) -> Void) -> Perform {
            return Perform(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), performs: perform)
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, perform: @escaping ([U]) -> Void) -> Perform {
            return Perform(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolWithMethodThatThrows

open class ProtocolWithMethodThatThrowsMock: ProtocolWithMethodThatThrows, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func methodThatThrows() throws {
        addInvocation(.m_methodThatThrows)
		let perform = methodPerformValue(.m_methodThatThrows) as? () -> Void
		perform?()
		do {
		    _ = try methodReturnValue(.m_methodThatThrows).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func methodThatReturnsAndThrows(param: Int) throws -> Bool {
        addInvocation(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`)))
		let perform = methodPerformValue(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`))) as? (Int) -> Void
		perform?(`param`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for methodThatReturnsAndThrows(param: Int). Use given")
			Failure("Stub return value not specified for methodThatReturnsAndThrows(param: Int). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatThrows
        case m_methodThatReturnsAndThrows__param_param(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_methodThatThrows, .m_methodThatThrows): return .match

            case (.m_methodThatReturnsAndThrows__param_param(let lhsParam), .m_methodThatReturnsAndThrows__param_param(let rhsParam)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher), lhsParam, rhsParam, "param"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_methodThatThrows: return 0
            case let .m_methodThatReturnsAndThrows__param_param(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_methodThatThrows: return ".methodThatThrows()"
            case .m_methodThatReturnsAndThrows__param_param: return ".methodThatReturnsAndThrows(param:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatThrows(willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatThrows(willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatThrows() -> Verify { return Verify(method: .m_methodThatThrows)}
        public static func methodThatReturnsAndThrows(param: Parameter<Int>) -> Verify { return Verify(method: .m_methodThatReturnsAndThrows__param_param(`param`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatThrows(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodThatThrows, performs: perform)
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_methodThatReturnsAndThrows__param_param(`param`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolWithProperties

open class ProtocolWithPropertiesMock: ProtocolWithProperties, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var someGetSetProperty: Int {
		get {	invocations.append(.p_someGetSetProperty_get); return __p_someGetSetProperty ?? givenGetterValue(.p_someGetSetProperty_get, "ProtocolWithPropertiesMock - stub value for someGetSetProperty was not defined") }
		set {	invocations.append(.p_someGetSetProperty_set(.value(newValue))); __p_someGetSetProperty = newValue }
	}
	private var __p_someGetSetProperty: (Int)?

    public var someGetProperty: String {
		get {	invocations.append(.p_someGetProperty_get); return __p_someGetProperty ?? givenGetterValue(.p_someGetProperty_get, "ProtocolWithPropertiesMock - stub value for someGetProperty was not defined") }
	}
	private var __p_someGetProperty: (String)?






    fileprivate enum MethodType {
        case p_someGetSetProperty_get
		case p_someGetSetProperty_set(Parameter<Int>)
        case p_someGetProperty_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {            case (.p_someGetSetProperty_get,.p_someGetSetProperty_get): return Matcher.ComparisonResult.match
			case (.p_someGetSetProperty_set(let left),.p_someGetSetProperty_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<Int>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            case (.p_someGetProperty_get,.p_someGetProperty_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_someGetSetProperty_get: return 0
			case .p_someGetSetProperty_set(let newValue): return newValue.intValue
            case .p_someGetProperty_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .p_someGetSetProperty_get: return "[get] .someGetSetProperty"
			case .p_someGetSetProperty_set: return "[set] .someGetSetProperty"
            case .p_someGetProperty_get: return "[get] .someGetProperty"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func someGetSetProperty(getter defaultValue: Int...) -> PropertyStub {
            return Given(method: .p_someGetSetProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func someGetProperty(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_someGetProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var someGetSetProperty: Verify { return Verify(method: .p_someGetSetProperty_get) }
		public static func someGetSetProperty(set newValue: Parameter<Int>) -> Verify { return Verify(method: .p_someGetSetProperty_set(newValue)) }
        public static var someGetProperty: Verify { return Verify(method: .p_someGetProperty_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolWithStatic

open class ProtocolWithStaticMock: ProtocolWithStatic, Mock, StaticMock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var queue = DispatchQueue(label: "com.swiftymocky.invocations.static", qos: .userInteractive)
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public static func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }


    public static var staticProperty: String {
		get {	ProtocolWithStaticMock.invocations.append(.p_staticProperty_get); return ProtocolWithStaticMock.__p_staticProperty ?? givenGetterValue(.p_staticProperty_get, "ProtocolWithStaticMock - stub value for staticProperty was not defined") }
	}
	private static var __p_staticProperty: (String)?




    public static func staticMethod(param: Int) throws -> Int {
        addInvocation(.sm_staticMethod__param_param(Parameter<Int>.value(`param`)))
		let perform = methodPerformValue(.sm_staticMethod__param_param(Parameter<Int>.value(`param`))) as? (Int) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.sm_staticMethod__param_param(Parameter<Int>.value(`param`))).casted()
		} catch MockError.notStubed {
			Failure("Stub return value not specified for staticMethod(param: Int). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    fileprivate enum StaticMethodType {
        case sm_staticMethod__param_param(Parameter<Int>)
        case p_staticProperty_get

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.sm_staticMethod__param_param(let lhsParam), .sm_staticMethod__param_param(let rhsParam)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher), lhsParam, rhsParam, "param"))
				return Matcher.ComparisonResult(results)
            case (.p_staticProperty_get,.p_staticProperty_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_staticMethod__param_param(p0): return p0.intValue
                case .p_staticProperty_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .sm_staticMethod__param_param: return ".staticMethod(param:)"
            case .p_staticProperty_get: return "[get] .staticProperty"

            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func staticProperty(getter defaultValue: String...) -> StaticPropertyStub {
            return StaticGiven(method: .p_staticProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func staticMethod(param: Parameter<Int>, willReturn: Int...) -> StaticMethodStub {
            return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func staticMethod(param: Parameter<Int>, willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func staticMethod(param: Parameter<Int>, willProduce: (StubberThrows<Int>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func staticMethod(param: Parameter<Int>) -> StaticVerify { return StaticVerify(method: .sm_staticMethod__param_param(`param`))}
        public static var staticProperty: StaticVerify { return StaticVerify(method: .p_staticProperty_get) }
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func staticMethod(param: Parameter<Int>, perform: @escaping (Int) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_staticMethod__param_param(`param`), performs: perform)
        }
    }

    
    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult { return .match }
        func intValue() -> Int { return 0 }
        func assertionName() -> String { return "" }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return StaticMethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        self.queue.sync { invocations.append(call) }
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType, file: StaticString?, line: UInt?) -> [StaticMethodType] {
        matcher.set(file: file, line: line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    static private func matchingCalls(_ method: StaticVerify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - ProtocolWithTuples

open class ProtocolWithTuplesMock: ProtocolWithTuples, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func methodThatTakesTuple(tuple: (String,Int)) -> Int {
        addInvocation(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`)))
		let perform = methodPerformValue(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`))) as? ((String,Int)) -> Void
		perform?(`tuple`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodThatTakesTuple(tuple: (String,Int)). Use given")
			Failure("Stub return value not specified for methodThatTakesTuple(tuple: (String,Int)). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_methodThatTakesTuple__tuple_tuple(let lhsTuple), .m_methodThatTakesTuple__tuple_tuple(let rhsTuple)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsTuple, rhs: rhsTuple, with: matcher), lhsTuple, rhsTuple, "tuple"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodThatTakesTuple__tuple_tuple(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_methodThatTakesTuple__tuple_tuple: return ".methodThatTakesTuple(tuple:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>) -> Verify { return Verify(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, perform: @escaping ((String,Int)) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ProtocolsWithSimpleMethods

open class ProtocolsWithSimpleMethodsMock: ProtocolsWithSimpleMethods, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func simpleMethodThatReturns() -> Int {
        addInvocation(.m_simpleMethodThatReturns)
		let perform = methodPerformValue(.m_simpleMethodThatReturns) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_simpleMethodThatReturns).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMethodThatReturns(). Use given")
			Failure("Stub return value not specified for simpleMethodThatReturns(). Use given")
		}
		return __value
    }

    open func simpleMethodThatReturns(param: String) -> String {
        addInvocation(.m_simpleMethodThatReturns__param_param(Parameter<String>.value(`param`)))
		let perform = methodPerformValue(.m_simpleMethodThatReturns__param_param(Parameter<String>.value(`param`))) as? (String) -> Void
		perform?(`param`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_simpleMethodThatReturns__param_param(Parameter<String>.value(`param`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMethodThatReturns(param: String). Use given")
			Failure("Stub return value not specified for simpleMethodThatReturns(param: String). Use given")
		}
		return __value
    }

    open func simpleMethodThatReturns(optionalParam: String?) -> String? {
        addInvocation(.m_simpleMethodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`)))
		let perform = methodPerformValue(.m_simpleMethodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))) as? (String?) -> Void
		perform?(`optionalParam`)
		var __value: String? = nil
		do {
		    __value = try methodReturnValue(.m_simpleMethodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_simpleMethodThatReturns
        case m_simpleMethodThatReturns__param_param(Parameter<String>)
        case m_simpleMethodThatReturns__optionalParam_optionalParam(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_simpleMethodThatReturns, .m_simpleMethodThatReturns): return .match

            case (.m_simpleMethodThatReturns__param_param(let lhsParam), .m_simpleMethodThatReturns__param_param(let rhsParam)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher), lhsParam, rhsParam, "param"))
				return Matcher.ComparisonResult(results)

            case (.m_simpleMethodThatReturns__optionalParam_optionalParam(let lhsOptionalparam), .m_simpleMethodThatReturns__optionalParam_optionalParam(let rhsOptionalparam)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsOptionalparam, rhs: rhsOptionalparam, with: matcher), lhsOptionalparam, rhsOptionalparam, "optionalParam"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_simpleMethodThatReturns: return 0
            case let .m_simpleMethodThatReturns__param_param(p0): return p0.intValue
            case let .m_simpleMethodThatReturns__optionalParam_optionalParam(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_simpleMethodThatReturns: return ".simpleMethodThatReturns()"
            case .m_simpleMethodThatReturns__param_param: return ".simpleMethodThatReturns(param:)"
            case .m_simpleMethodThatReturns__optionalParam_optionalParam: return ".simpleMethodThatReturns(optionalParam:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func simpleMethodThatReturns(willReturn: Int...) -> MethodStub {
            return Given(method: .m_simpleMethodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMethodThatReturns(param: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_simpleMethodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMethodThatReturns(optionalParam: Parameter<String?>, willReturn: String?...) -> MethodStub {
            return Given(method: .m_simpleMethodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMethodThatReturns(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_simpleMethodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMethodThatReturns(param: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_simpleMethodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMethodThatReturns(optionalParam: Parameter<String?>, willProduce: (Stubber<String?>) -> Void) -> MethodStub {
            let willReturn: [String?] = []
			let given: Given = { return Given(method: .m_simpleMethodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func simpleMethodThatReturns() -> Verify { return Verify(method: .m_simpleMethodThatReturns)}
        public static func simpleMethodThatReturns(param: Parameter<String>) -> Verify { return Verify(method: .m_simpleMethodThatReturns__param_param(`param`))}
        public static func simpleMethodThatReturns(optionalParam: Parameter<String?>) -> Verify { return Verify(method: .m_simpleMethodThatReturns__optionalParam_optionalParam(`optionalParam`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func simpleMethodThatReturns(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMethodThatReturns, performs: perform)
        }
        public static func simpleMethodThatReturns(param: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_simpleMethodThatReturns__param_param(`param`), performs: perform)
        }
        public static func simpleMethodThatReturns(optionalParam: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_simpleMethodThatReturns__optionalParam_optionalParam(`optionalParam`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

