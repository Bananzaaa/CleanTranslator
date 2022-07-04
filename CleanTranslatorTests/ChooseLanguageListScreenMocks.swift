// MARK: - Mocks generated from file: CleanTranslator/ChooseLanguageListScreen/Interactor/ChooseLanguageListScreenInteractor.swift at 2022-07-03 15:01:34 +0000

//  ChooseLanguageListScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля

import Cuckoo
@testable import CleanTranslator


 class MockChooseLanguageListScreenModuleOutput: ChooseLanguageListScreenModuleOutput, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenModuleOutput
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenModuleOutput
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenModuleOutput

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenModuleOutput?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenModuleOutput) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didChooseLanguage(_ languageModelId: String)  {
        
    return cuckoo_manager.call("didChooseLanguage(_: String)",
            parameters: (languageModelId),
            escapingParameters: (languageModelId),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didChooseLanguage(languageModelId))
        
    }
    

	 struct __StubbingProxy_ChooseLanguageListScreenModuleOutput: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didChooseLanguage<M1: Cuckoo.Matchable>(_ languageModelId: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: languageModelId) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenModuleOutput.self, method: "didChooseLanguage(_: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenModuleOutput: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didChooseLanguage<M1: Cuckoo.Matchable>(_ languageModelId: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: languageModelId) { $0 }]
	        return cuckoo_manager.verify("didChooseLanguage(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChooseLanguageListScreenModuleOutputStub: ChooseLanguageListScreenModuleOutput {
    

    

    
    
    
     func didChooseLanguage(_ languageModelId: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockChooseLanguageListScreenUpdater: ChooseLanguageListScreenUpdater, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenUpdater
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenUpdater
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenUpdater

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenUpdater?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenUpdater) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_ChooseLanguageListScreenUpdater: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenUpdater: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class ChooseLanguageListScreenUpdaterStub: ChooseLanguageListScreenUpdater {
    

    

    
}



 class MockChooseLanguageListScreenBusinessLogic: ChooseLanguageListScreenBusinessLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenBusinessLogic
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenBusinessLogic
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenBusinessLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenBusinessLogic?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenBusinessLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didLoad()  {
        
    return cuckoo_manager.call("didLoad()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didLoad())
        
    }
    
    
    
     func didRequestChooseLanguage()  {
        
    return cuckoo_manager.call("didRequestChooseLanguage()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didRequestChooseLanguage())
        
    }
    

	 struct __StubbingProxy_ChooseLanguageListScreenBusinessLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didLoad() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenBusinessLogic.self, method: "didLoad()", parameterMatchers: matchers))
	    }
	    
	    func didRequestChooseLanguage() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenBusinessLogic.self, method: "didRequestChooseLanguage()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenBusinessLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("didLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didRequestChooseLanguage() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("didRequestChooseLanguage()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChooseLanguageListScreenBusinessLogicStub: ChooseLanguageListScreenBusinessLogic {
    

    

    
    
    
     func didLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func didRequestChooseLanguage()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/ChooseLanguageListScreen/Presenter/ChooseLanguageListScreenPresenter.swift at 2022-07-03 15:01:34 +0000

//  ChooseLanguageListScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import Cuckoo
@testable import CleanTranslator

import UIKit


 class MockChooseLanguageListScreenPresentationLogic: ChooseLanguageListScreenPresentationLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenPresentationLogic
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenPresentationLogic
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenPresentationLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenPresentationLogic?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenPresentationLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func setupScreen()  {
        
    return cuckoo_manager.call("setupScreen()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.setupScreen())
        
    }
    
    
    
     func updateScreen(_ response: ChooseLanguageListScreenModels.UpdateScreen.Response)  {
        
    return cuckoo_manager.call("updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.Response)",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.updateScreen(response))
        
    }
    
    
    
     func presentError(_ response: ChooseLanguageListScreenModels.Error.Response)  {
        
    return cuckoo_manager.call("presentError(_: ChooseLanguageListScreenModels.Error.Response)",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentError(response))
        
    }
    
    
    
     func presentLoading()  {
        
    return cuckoo_manager.call("presentLoading()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentLoading())
        
    }
    
    
    
     func hideLoading()  {
        
    return cuckoo_manager.call("hideLoading()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoading())
        
    }
    

	 struct __StubbingProxy_ChooseLanguageListScreenPresentationLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func setupScreen() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenPresentationLogic.self, method: "setupScreen()", parameterMatchers: matchers))
	    }
	    
	    func updateScreen<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChooseLanguageListScreenModels.UpdateScreen.Response)> where M1.MatchedType == ChooseLanguageListScreenModels.UpdateScreen.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.UpdateScreen.Response)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenPresentationLogic.self, method: "updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.Response)", parameterMatchers: matchers))
	    }
	    
	    func presentError<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChooseLanguageListScreenModels.Error.Response)> where M1.MatchedType == ChooseLanguageListScreenModels.Error.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Error.Response)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenPresentationLogic.self, method: "presentError(_: ChooseLanguageListScreenModels.Error.Response)", parameterMatchers: matchers))
	    }
	    
	    func presentLoading() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenPresentationLogic.self, method: "presentLoading()", parameterMatchers: matchers))
	    }
	    
	    func hideLoading() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenPresentationLogic.self, method: "hideLoading()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenPresentationLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func setupScreen() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("setupScreen()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateScreen<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(ChooseLanguageListScreenModels.UpdateScreen.Response), Void> where M1.MatchedType == ChooseLanguageListScreenModels.UpdateScreen.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.UpdateScreen.Response)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.Response)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func presentError<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(ChooseLanguageListScreenModels.Error.Response), Void> where M1.MatchedType == ChooseLanguageListScreenModels.Error.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Error.Response)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("presentError(_: ChooseLanguageListScreenModels.Error.Response)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func presentLoading() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("presentLoading()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func hideLoading() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("hideLoading()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChooseLanguageListScreenPresentationLogicStub: ChooseLanguageListScreenPresentationLogic {
    

    

    
    
    
     func setupScreen()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func updateScreen(_ response: ChooseLanguageListScreenModels.UpdateScreen.Response)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func presentError(_ response: ChooseLanguageListScreenModels.Error.Response)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func presentLoading()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func hideLoading()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/ChooseLanguageListScreen/ViewControllers/ChooseLanguageListScreenViewController.swift at 2022-07-03 15:01:34 +0000

//  ChooseLanguageListScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import Cuckoo
@testable import CleanTranslator

import UIKit


 class MockChooseLanguageListScreenDisplayLogic: ChooseLanguageListScreenDisplayLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenDisplayLogic
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenDisplayLogic
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenDisplayLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenDisplayLogic?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenDisplayLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel)  {
        
    return cuckoo_manager.call("setupScreen(_: ChooseLanguageListScreenModels.Setup.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.setupScreen(viewModel))
        
    }
    
    
    
     func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)  {
        
    return cuckoo_manager.call("updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.updateScreen(viewModel))
        
    }
    
    
    
     func displayLoading()  {
        
    return cuckoo_manager.call("displayLoading()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayLoading())
        
    }
    
    
    
     func hideLoading()  {
        
    return cuckoo_manager.call("hideLoading()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoading())
        
    }
    
    
    
     func displayError(_ viewModel: ChooseLanguageListScreenModels.Error.ViewModel)  {
        
    return cuckoo_manager.call("displayError(_: ChooseLanguageListScreenModels.Error.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayError(viewModel))
        
    }
    

	 struct __StubbingProxy_ChooseLanguageListScreenDisplayLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func setupScreen<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChooseLanguageListScreenModels.Setup.ViewModel)> where M1.MatchedType == ChooseLanguageListScreenModels.Setup.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Setup.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenDisplayLogic.self, method: "setupScreen(_: ChooseLanguageListScreenModels.Setup.ViewModel)", parameterMatchers: matchers))
	    }
	    
	    func updateScreen<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChooseLanguageListScreenModels.UpdateScreen.ViewModel)> where M1.MatchedType == ChooseLanguageListScreenModels.UpdateScreen.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.UpdateScreen.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenDisplayLogic.self, method: "updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)", parameterMatchers: matchers))
	    }
	    
	    func displayLoading() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenDisplayLogic.self, method: "displayLoading()", parameterMatchers: matchers))
	    }
	    
	    func hideLoading() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenDisplayLogic.self, method: "hideLoading()", parameterMatchers: matchers))
	    }
	    
	    func displayError<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChooseLanguageListScreenModels.Error.ViewModel)> where M1.MatchedType == ChooseLanguageListScreenModels.Error.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Error.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenDisplayLogic.self, method: "displayError(_: ChooseLanguageListScreenModels.Error.ViewModel)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenDisplayLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func setupScreen<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.__DoNotUse<(ChooseLanguageListScreenModels.Setup.ViewModel), Void> where M1.MatchedType == ChooseLanguageListScreenModels.Setup.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Setup.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("setupScreen(_: ChooseLanguageListScreenModels.Setup.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateScreen<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.__DoNotUse<(ChooseLanguageListScreenModels.UpdateScreen.ViewModel), Void> where M1.MatchedType == ChooseLanguageListScreenModels.UpdateScreen.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.UpdateScreen.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("updateScreen(_: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func displayLoading() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("displayLoading()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func hideLoading() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("hideLoading()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func displayError<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.__DoNotUse<(ChooseLanguageListScreenModels.Error.ViewModel), Void> where M1.MatchedType == ChooseLanguageListScreenModels.Error.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(ChooseLanguageListScreenModels.Error.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("displayError(_: ChooseLanguageListScreenModels.Error.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChooseLanguageListScreenDisplayLogicStub: ChooseLanguageListScreenDisplayLogic {
    

    

    
    
    
     func setupScreen(_ viewModel: ChooseLanguageListScreenModels.Setup.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func updateScreen(_ viewModel: ChooseLanguageListScreenModels.UpdateScreen.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func displayLoading()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func hideLoading()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func displayError(_ viewModel: ChooseLanguageListScreenModels.Error.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/ChooseLanguageListScreen/Worker/ChooseLanguageListScreenWorker.swift at 2022-07-03 15:01:34 +0000

//  ChooseLanguageListScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//  
//

import Cuckoo
@testable import CleanTranslator


 class MockChooseLanguageListScreenWorkerProtocol: ChooseLanguageListScreenWorkerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChooseLanguageListScreenWorkerProtocol
    
     typealias Stubbing = __StubbingProxy_ChooseLanguageListScreenWorkerProtocol
     typealias Verification = __VerificationProxy_ChooseLanguageListScreenWorkerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChooseLanguageListScreenWorkerProtocol?

     func enableDefaultImplementation(_ stub: ChooseLanguageListScreenWorkerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var currentLanguageCode: String {
        get {
            return cuckoo_manager.getter("currentLanguageCode",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.currentLanguageCode)
        }
        
    }
    
    
    
     var currentLanguageName: String {
        get {
            return cuckoo_manager.getter("currentLanguageName",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.currentLanguageName)
        }
        
    }
    

    

    
    
    
     func changeCurrentLanguage(_ languageCode: String)  {
        
    return cuckoo_manager.call("changeCurrentLanguage(_: String)",
            parameters: (languageCode),
            escapingParameters: (languageCode),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.changeCurrentLanguage(languageCode))
        
    }
    
    
    
     func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)  {
        
    return cuckoo_manager.call("getLanguageList(_: @escaping (Result<[LanguageModel], Error>) -> Void)",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getLanguageList(completion))
        
    }
    

	 struct __StubbingProxy_ChooseLanguageListScreenWorkerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var currentLanguageCode: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockChooseLanguageListScreenWorkerProtocol, String> {
	        return .init(manager: cuckoo_manager, name: "currentLanguageCode")
	    }
	    
	    
	    var currentLanguageName: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockChooseLanguageListScreenWorkerProtocol, String> {
	        return .init(manager: cuckoo_manager, name: "currentLanguageName")
	    }
	    
	    
	    func changeCurrentLanguage<M1: Cuckoo.Matchable>(_ languageCode: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: languageCode) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenWorkerProtocol.self, method: "changeCurrentLanguage(_: String)", parameterMatchers: matchers))
	    }
	    
	    func getLanguageList<M1: Cuckoo.Matchable>(_ completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((Result<[LanguageModel], Error>) -> Void)> where M1.MatchedType == (Result<[LanguageModel], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Result<[LanguageModel], Error>) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChooseLanguageListScreenWorkerProtocol.self, method: "getLanguageList(_: @escaping (Result<[LanguageModel], Error>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChooseLanguageListScreenWorkerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var currentLanguageCode: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "currentLanguageCode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var currentLanguageName: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "currentLanguageName", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func changeCurrentLanguage<M1: Cuckoo.Matchable>(_ languageCode: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: languageCode) { $0 }]
	        return cuckoo_manager.verify("changeCurrentLanguage(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getLanguageList<M1: Cuckoo.Matchable>(_ completion: M1) -> Cuckoo.__DoNotUse<((Result<[LanguageModel], Error>) -> Void), Void> where M1.MatchedType == (Result<[LanguageModel], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Result<[LanguageModel], Error>) -> Void)>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("getLanguageList(_: @escaping (Result<[LanguageModel], Error>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChooseLanguageListScreenWorkerProtocolStub: ChooseLanguageListScreenWorkerProtocol {
        
    
    
     var currentLanguageCode: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
        
    
    
     var currentLanguageName: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
    
    
     func changeCurrentLanguage(_ languageCode: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func getLanguageList(_ completion: @escaping (Result<[LanguageModel], Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

