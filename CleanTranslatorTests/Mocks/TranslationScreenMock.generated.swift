// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
@testable import CleanTranslator


// MARK: - TranslationScreenDisplayLogic

open class TranslationScreenDisplayLogicMock: TranslationScreenDisplayLogic, Mock {
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





    open func displaySetupScreen(with viewModel: TranslationScreenModels.Setup.ViewModel) {
        addInvocation(.m_displaySetupScreen__with_viewModel(Parameter<TranslationScreenModels.Setup.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_displaySetupScreen__with_viewModel(Parameter<TranslationScreenModels.Setup.ViewModel>.value(`viewModel`))) as? (TranslationScreenModels.Setup.ViewModel) -> Void
		perform?(`viewModel`)
    }

    open func displayTranslatedText(_ viewModel: TranslationScreenModels.Update.ViewModel) {
        addInvocation(.m_displayTranslatedText__viewModel(Parameter<TranslationScreenModels.Update.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_displayTranslatedText__viewModel(Parameter<TranslationScreenModels.Update.ViewModel>.value(`viewModel`))) as? (TranslationScreenModels.Update.ViewModel) -> Void
		perform?(`viewModel`)
    }

    open func displayError(_ viewModel: TranslationScreenModels.Error.ViewModel) {
        addInvocation(.m_displayError__viewModel(Parameter<TranslationScreenModels.Error.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_displayError__viewModel(Parameter<TranslationScreenModels.Error.ViewModel>.value(`viewModel`))) as? (TranslationScreenModels.Error.ViewModel) -> Void
		perform?(`viewModel`)
    }


    fileprivate enum MethodType {
        case m_displaySetupScreen__with_viewModel(Parameter<TranslationScreenModels.Setup.ViewModel>)
        case m_displayTranslatedText__viewModel(Parameter<TranslationScreenModels.Update.ViewModel>)
        case m_displayError__viewModel(Parameter<TranslationScreenModels.Error.ViewModel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_displaySetupScreen__with_viewModel(let lhsViewmodel), .m_displaySetupScreen__with_viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "with viewModel"))
				return Matcher.ComparisonResult(results)

            case (.m_displayTranslatedText__viewModel(let lhsViewmodel), .m_displayTranslatedText__viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "_ viewModel"))
				return Matcher.ComparisonResult(results)

            case (.m_displayError__viewModel(let lhsViewmodel), .m_displayError__viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "_ viewModel"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_displaySetupScreen__with_viewModel(p0): return p0.intValue
            case let .m_displayTranslatedText__viewModel(p0): return p0.intValue
            case let .m_displayError__viewModel(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_displaySetupScreen__with_viewModel: return ".displaySetupScreen(with:)"
            case .m_displayTranslatedText__viewModel: return ".displayTranslatedText(_:)"
            case .m_displayError__viewModel: return ".displayError(_:)"
            }
        }
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

        public static func displaySetupScreen(with viewModel: Parameter<TranslationScreenModels.Setup.ViewModel>) -> Verify { return Verify(method: .m_displaySetupScreen__with_viewModel(`viewModel`))}
        public static func displayTranslatedText(_ viewModel: Parameter<TranslationScreenModels.Update.ViewModel>) -> Verify { return Verify(method: .m_displayTranslatedText__viewModel(`viewModel`))}
        public static func displayError(_ viewModel: Parameter<TranslationScreenModels.Error.ViewModel>) -> Verify { return Verify(method: .m_displayError__viewModel(`viewModel`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func displaySetupScreen(with viewModel: Parameter<TranslationScreenModels.Setup.ViewModel>, perform: @escaping (TranslationScreenModels.Setup.ViewModel) -> Void) -> Perform {
            return Perform(method: .m_displaySetupScreen__with_viewModel(`viewModel`), performs: perform)
        }
        public static func displayTranslatedText(_ viewModel: Parameter<TranslationScreenModels.Update.ViewModel>, perform: @escaping (TranslationScreenModels.Update.ViewModel) -> Void) -> Perform {
            return Perform(method: .m_displayTranslatedText__viewModel(`viewModel`), performs: perform)
        }
        public static func displayError(_ viewModel: Parameter<TranslationScreenModels.Error.ViewModel>, perform: @escaping (TranslationScreenModels.Error.ViewModel) -> Void) -> Perform {
            return Perform(method: .m_displayError__viewModel(`viewModel`), performs: perform)
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

// MARK: - TranslationScreenPresentationLogic

open class TranslationScreenPresentationLogicMock: TranslationScreenPresentationLogic, Mock {
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





    open func presentSetupScreen(_ response: TranslationScreenModels.Setup.Response) {
        addInvocation(.m_presentSetupScreen__response(Parameter<TranslationScreenModels.Setup.Response>.value(`response`)))
		let perform = methodPerformValue(.m_presentSetupScreen__response(Parameter<TranslationScreenModels.Setup.Response>.value(`response`))) as? (TranslationScreenModels.Setup.Response) -> Void
		perform?(`response`)
    }

    open func presentTranslation(_ response: TranslationScreenModels.Update.Response) {
        addInvocation(.m_presentTranslation__response(Parameter<TranslationScreenModels.Update.Response>.value(`response`)))
		let perform = methodPerformValue(.m_presentTranslation__response(Parameter<TranslationScreenModels.Update.Response>.value(`response`))) as? (TranslationScreenModels.Update.Response) -> Void
		perform?(`response`)
    }

    open func presentError(_ response: TranslationScreenModels.Error.Response) {
        addInvocation(.m_presentError__response(Parameter<TranslationScreenModels.Error.Response>.value(`response`)))
		let perform = methodPerformValue(.m_presentError__response(Parameter<TranslationScreenModels.Error.Response>.value(`response`))) as? (TranslationScreenModels.Error.Response) -> Void
		perform?(`response`)
    }


    fileprivate enum MethodType {
        case m_presentSetupScreen__response(Parameter<TranslationScreenModels.Setup.Response>)
        case m_presentTranslation__response(Parameter<TranslationScreenModels.Update.Response>)
        case m_presentError__response(Parameter<TranslationScreenModels.Error.Response>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_presentSetupScreen__response(let lhsResponse), .m_presentSetupScreen__response(let rhsResponse)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsResponse, rhs: rhsResponse, with: matcher), lhsResponse, rhsResponse, "_ response"))
				return Matcher.ComparisonResult(results)

            case (.m_presentTranslation__response(let lhsResponse), .m_presentTranslation__response(let rhsResponse)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsResponse, rhs: rhsResponse, with: matcher), lhsResponse, rhsResponse, "_ response"))
				return Matcher.ComparisonResult(results)

            case (.m_presentError__response(let lhsResponse), .m_presentError__response(let rhsResponse)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsResponse, rhs: rhsResponse, with: matcher), lhsResponse, rhsResponse, "_ response"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_presentSetupScreen__response(p0): return p0.intValue
            case let .m_presentTranslation__response(p0): return p0.intValue
            case let .m_presentError__response(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_presentSetupScreen__response: return ".presentSetupScreen(_:)"
            case .m_presentTranslation__response: return ".presentTranslation(_:)"
            case .m_presentError__response: return ".presentError(_:)"
            }
        }
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

        public static func presentSetupScreen(_ response: Parameter<TranslationScreenModels.Setup.Response>) -> Verify { return Verify(method: .m_presentSetupScreen__response(`response`))}
        public static func presentTranslation(_ response: Parameter<TranslationScreenModels.Update.Response>) -> Verify { return Verify(method: .m_presentTranslation__response(`response`))}
        public static func presentError(_ response: Parameter<TranslationScreenModels.Error.Response>) -> Verify { return Verify(method: .m_presentError__response(`response`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func presentSetupScreen(_ response: Parameter<TranslationScreenModels.Setup.Response>, perform: @escaping (TranslationScreenModels.Setup.Response) -> Void) -> Perform {
            return Perform(method: .m_presentSetupScreen__response(`response`), performs: perform)
        }
        public static func presentTranslation(_ response: Parameter<TranslationScreenModels.Update.Response>, perform: @escaping (TranslationScreenModels.Update.Response) -> Void) -> Perform {
            return Perform(method: .m_presentTranslation__response(`response`), performs: perform)
        }
        public static func presentError(_ response: Parameter<TranslationScreenModels.Error.Response>, perform: @escaping (TranslationScreenModels.Error.Response) -> Void) -> Perform {
            return Perform(method: .m_presentError__response(`response`), performs: perform)
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

// MARK: - TranslationScreenWorkerProtocol

open class TranslationScreenWorkerProtocolMock: TranslationScreenWorkerProtocol, Mock {
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

    public var translationModelId: String {
		get {	invocations.append(.p_translationModelId_get); return __p_translationModelId ?? givenGetterValue(.p_translationModelId_get, "TranslationScreenWorkerProtocolMock - stub value for translationModelId was not defined") }
	}
	private var __p_translationModelId: (String)?





    open func translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void) {
        addInvocation(.m_translate__text_textcompletion_completion(Parameter<String>.value(`text`), Parameter<(Result<[TranslationModel], Error>) -> Void>.value(`completion`)))
		let perform = methodPerformValue(.m_translate__text_textcompletion_completion(Parameter<String>.value(`text`), Parameter<(Result<[TranslationModel], Error>) -> Void>.value(`completion`))) as? (String, @escaping (Result<[TranslationModel], Error>) -> Void) -> Void
		perform?(`text`, `completion`)
    }


    fileprivate enum MethodType {
        case m_translate__text_textcompletion_completion(Parameter<String>, Parameter<(Result<[TranslationModel], Error>) -> Void>)
        case p_translationModelId_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_translate__text_textcompletion_completion(let lhsText, let lhsCompletion), .m_translate__text_textcompletion_completion(let rhsText, let rhsCompletion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsText, rhs: rhsText, with: matcher), lhsText, rhsText, "text"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher), lhsCompletion, rhsCompletion, "completion"))
				return Matcher.ComparisonResult(results)
            case (.p_translationModelId_get,.p_translationModelId_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_translate__text_textcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case .p_translationModelId_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_translate__text_textcompletion_completion: return ".translate(text:completion:)"
            case .p_translationModelId_get: return "[get] .translationModelId"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func translationModelId(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_translationModelId_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func translate(text: Parameter<String>, completion: Parameter<(Result<[TranslationModel], Error>) -> Void>) -> Verify { return Verify(method: .m_translate__text_textcompletion_completion(`text`, `completion`))}
        public static var translationModelId: Verify { return Verify(method: .p_translationModelId_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func translate(text: Parameter<String>, completion: Parameter<(Result<[TranslationModel], Error>) -> Void>, perform: @escaping (String, @escaping (Result<[TranslationModel], Error>) -> Void) -> Void) -> Perform {
            return Perform(method: .m_translate__text_textcompletion_completion(`text`, `completion`), performs: perform)
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

