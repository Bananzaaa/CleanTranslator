// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation
@testable import CleanTranslator


// MARK: - ChooseLanguageListScreenBusinessLogic

open class ChooseLanguageListScreenBusinessLogicMock: ChooseLanguageListScreenBusinessLogic, Mock {
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





    open func didLoad() {
        addInvocation(.m_didLoad)
		let perform = methodPerformValue(.m_didLoad) as? () -> Void
		perform?()
    }

    open func didRequestChooseLanguage() {
        addInvocation(.m_didRequestChooseLanguage)
		let perform = methodPerformValue(.m_didRequestChooseLanguage) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_didLoad
        case m_didRequestChooseLanguage

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_didLoad, .m_didLoad): return .match

            case (.m_didRequestChooseLanguage, .m_didRequestChooseLanguage): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_didLoad: return 0
            case .m_didRequestChooseLanguage: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_didLoad: return ".didLoad()"
            case .m_didRequestChooseLanguage: return ".didRequestChooseLanguage()"
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

        public static func didLoad() -> Verify { return Verify(method: .m_didLoad)}
        public static func didRequestChooseLanguage() -> Verify { return Verify(method: .m_didRequestChooseLanguage)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_didLoad, performs: perform)
        }
        public static func didRequestChooseLanguage(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_didRequestChooseLanguage, performs: perform)
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

// MARK: - ChooseLanguageListScreenDisplayLogic

open class ChooseLanguageListScreenDisplayLogicMock: ChooseLanguageListScreenDisplayLogic, Mock {
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





    open func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel) {
        addInvocation(.m_setupScreen__viewModel(Parameter<ChooseLanguageListScreenModels.Setup.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_setupScreen__viewModel(Parameter<ChooseLanguageListScreenModels.Setup.ViewModel>.value(`viewModel`))) as? (ChooseLanguageListScreenModels.Setup.ViewModel) -> Void
		perform?(`viewModel`)
    }

    open func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel) {
        addInvocation(.m_updateScreen__viewModel(Parameter<ChooseLanguageListScreenModels.UpdateScreen.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_updateScreen__viewModel(Parameter<ChooseLanguageListScreenModels.UpdateScreen.ViewModel>.value(`viewModel`))) as? (ChooseLanguageListScreenModels.UpdateScreen.ViewModel) -> Void
		perform?(`viewModel`)
    }

    open func displayLoading() {
        addInvocation(.m_displayLoading)
		let perform = methodPerformValue(.m_displayLoading) as? () -> Void
		perform?()
    }

    open func hideLoading() {
        addInvocation(.m_hideLoading)
		let perform = methodPerformValue(.m_hideLoading) as? () -> Void
		perform?()
    }

    open func displayError(_ viewModel: ChooseLanguageListScreenModels.Error.ViewModel) {
        addInvocation(.m_displayError__viewModel(Parameter<ChooseLanguageListScreenModels.Error.ViewModel>.value(`viewModel`)))
		let perform = methodPerformValue(.m_displayError__viewModel(Parameter<ChooseLanguageListScreenModels.Error.ViewModel>.value(`viewModel`))) as? (ChooseLanguageListScreenModels.Error.ViewModel) -> Void
		perform?(`viewModel`)
    }


    fileprivate enum MethodType {
        case m_setupScreen__viewModel(Parameter<ChooseLanguageListScreenModels.Setup.ViewModel>)
        case m_updateScreen__viewModel(Parameter<ChooseLanguageListScreenModels.UpdateScreen.ViewModel>)
        case m_displayLoading
        case m_hideLoading
        case m_displayError__viewModel(Parameter<ChooseLanguageListScreenModels.Error.ViewModel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupScreen__viewModel(let lhsViewmodel), .m_setupScreen__viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "_ viewModel"))
				return Matcher.ComparisonResult(results)

            case (.m_updateScreen__viewModel(let lhsViewmodel), .m_updateScreen__viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "_ viewModel"))
				return Matcher.ComparisonResult(results)

            case (.m_displayLoading, .m_displayLoading): return .match

            case (.m_hideLoading, .m_hideLoading): return .match

            case (.m_displayError__viewModel(let lhsViewmodel), .m_displayError__viewModel(let rhsViewmodel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsViewmodel, rhs: rhsViewmodel, with: matcher), lhsViewmodel, rhsViewmodel, "_ viewModel"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_setupScreen__viewModel(p0): return p0.intValue
            case let .m_updateScreen__viewModel(p0): return p0.intValue
            case .m_displayLoading: return 0
            case .m_hideLoading: return 0
            case let .m_displayError__viewModel(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupScreen__viewModel: return ".setupScreen(_:)"
            case .m_updateScreen__viewModel: return ".updateScreen(_:)"
            case .m_displayLoading: return ".displayLoading()"
            case .m_hideLoading: return ".hideLoading()"
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

        public static func setupScreen(_ viewModel: Parameter<ChooseLanguageListScreenModels.Setup.ViewModel>) -> Verify { return Verify(method: .m_setupScreen__viewModel(`viewModel`))}
        public static func updateScreen(_ viewModel: Parameter<ChooseLanguageListScreenModels.UpdateScreen.ViewModel>) -> Verify { return Verify(method: .m_updateScreen__viewModel(`viewModel`))}
        public static func displayLoading() -> Verify { return Verify(method: .m_displayLoading)}
        public static func hideLoading() -> Verify { return Verify(method: .m_hideLoading)}
        public static func displayError(_ viewModel: Parameter<ChooseLanguageListScreenModels.Error.ViewModel>) -> Verify { return Verify(method: .m_displayError__viewModel(`viewModel`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupScreen(_ viewModel: Parameter<ChooseLanguageListScreenModels.Setup.ViewModel>, perform: @escaping (ChooseLanguageListScreenModels.Setup.ViewModel) -> Void) -> Perform {
            return Perform(method: .m_setupScreen__viewModel(`viewModel`), performs: perform)
        }
        public static func updateScreen(_ viewModel: Parameter<ChooseLanguageListScreenModels.UpdateScreen.ViewModel>, perform: @escaping (ChooseLanguageListScreenModels.UpdateScreen.ViewModel) -> Void) -> Perform {
            return Perform(method: .m_updateScreen__viewModel(`viewModel`), performs: perform)
        }
        public static func displayLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_displayLoading, performs: perform)
        }
        public static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_hideLoading, performs: perform)
        }
        public static func displayError(_ viewModel: Parameter<ChooseLanguageListScreenModels.Error.ViewModel>, perform: @escaping (ChooseLanguageListScreenModels.Error.ViewModel) -> Void) -> Perform {
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

// MARK: - ChooseLanguageListScreenPresentationLogic

open class ChooseLanguageListScreenPresentationLogicMock: ChooseLanguageListScreenPresentationLogic, Mock {
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





    open func setupScreen() {
        addInvocation(.m_setupScreen)
		let perform = methodPerformValue(.m_setupScreen) as? () -> Void
		perform?()
    }

    open func updateScreen(_ response: ChooseLanguageListScreenModels.UpdateScreen.Response) {
        addInvocation(.m_updateScreen__response(Parameter<ChooseLanguageListScreenModels.UpdateScreen.Response>.value(`response`)))
		let perform = methodPerformValue(.m_updateScreen__response(Parameter<ChooseLanguageListScreenModels.UpdateScreen.Response>.value(`response`))) as? (ChooseLanguageListScreenModels.UpdateScreen.Response) -> Void
		perform?(`response`)
    }

    open func presentError(_ response: ChooseLanguageListScreenModels.Error.Response) {
        addInvocation(.m_presentError__response(Parameter<ChooseLanguageListScreenModels.Error.Response>.value(`response`)))
		let perform = methodPerformValue(.m_presentError__response(Parameter<ChooseLanguageListScreenModels.Error.Response>.value(`response`))) as? (ChooseLanguageListScreenModels.Error.Response) -> Void
		perform?(`response`)
    }

    open func presentLoading() {
        addInvocation(.m_presentLoading)
		let perform = methodPerformValue(.m_presentLoading) as? () -> Void
		perform?()
    }

    open func hideLoading() {
        addInvocation(.m_hideLoading)
		let perform = methodPerformValue(.m_hideLoading) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_setupScreen
        case m_updateScreen__response(Parameter<ChooseLanguageListScreenModels.UpdateScreen.Response>)
        case m_presentError__response(Parameter<ChooseLanguageListScreenModels.Error.Response>)
        case m_presentLoading
        case m_hideLoading

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setupScreen, .m_setupScreen): return .match

            case (.m_updateScreen__response(let lhsResponse), .m_updateScreen__response(let rhsResponse)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsResponse, rhs: rhsResponse, with: matcher), lhsResponse, rhsResponse, "_ response"))
				return Matcher.ComparisonResult(results)

            case (.m_presentError__response(let lhsResponse), .m_presentError__response(let rhsResponse)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsResponse, rhs: rhsResponse, with: matcher), lhsResponse, rhsResponse, "_ response"))
				return Matcher.ComparisonResult(results)

            case (.m_presentLoading, .m_presentLoading): return .match

            case (.m_hideLoading, .m_hideLoading): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_setupScreen: return 0
            case let .m_updateScreen__response(p0): return p0.intValue
            case let .m_presentError__response(p0): return p0.intValue
            case .m_presentLoading: return 0
            case .m_hideLoading: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setupScreen: return ".setupScreen()"
            case .m_updateScreen__response: return ".updateScreen(_:)"
            case .m_presentError__response: return ".presentError(_:)"
            case .m_presentLoading: return ".presentLoading()"
            case .m_hideLoading: return ".hideLoading()"
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

        public static func setupScreen() -> Verify { return Verify(method: .m_setupScreen)}
        public static func updateScreen(_ response: Parameter<ChooseLanguageListScreenModels.UpdateScreen.Response>) -> Verify { return Verify(method: .m_updateScreen__response(`response`))}
        public static func presentError(_ response: Parameter<ChooseLanguageListScreenModels.Error.Response>) -> Verify { return Verify(method: .m_presentError__response(`response`))}
        public static func presentLoading() -> Verify { return Verify(method: .m_presentLoading)}
        public static func hideLoading() -> Verify { return Verify(method: .m_hideLoading)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setupScreen(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setupScreen, performs: perform)
        }
        public static func updateScreen(_ response: Parameter<ChooseLanguageListScreenModels.UpdateScreen.Response>, perform: @escaping (ChooseLanguageListScreenModels.UpdateScreen.Response) -> Void) -> Perform {
            return Perform(method: .m_updateScreen__response(`response`), performs: perform)
        }
        public static func presentError(_ response: Parameter<ChooseLanguageListScreenModels.Error.Response>, perform: @escaping (ChooseLanguageListScreenModels.Error.Response) -> Void) -> Perform {
            return Perform(method: .m_presentError__response(`response`), performs: perform)
        }
        public static func presentLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_presentLoading, performs: perform)
        }
        public static func hideLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_hideLoading, performs: perform)
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

