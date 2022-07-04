// MARK: - Mocks generated from file: CleanTranslator/TranslationScreen/Interactor/TranslationScreenInteractor.swift at 2022-07-03 15:01:34 +0000

//  TranslationScreenInteractor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

/// Интерфейс для делегирования обработки событий вне модуля

import Cuckoo
@testable import CleanTranslator


 class MockTranslationScreenModuleOutput: TranslationScreenModuleOutput, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenModuleOutput
    
     typealias Stubbing = __StubbingProxy_TranslationScreenModuleOutput
     typealias Verification = __VerificationProxy_TranslationScreenModuleOutput

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenModuleOutput?

     func enableDefaultImplementation(_ stub: TranslationScreenModuleOutput) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_TranslationScreenModuleOutput: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_TranslationScreenModuleOutput: Cuckoo.VerificationProxy {
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

 class TranslationScreenModuleOutputStub: TranslationScreenModuleOutput {
    

    

    
}



 class MockTranslationScreenUpdater: TranslationScreenUpdater, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenUpdater
    
     typealias Stubbing = __StubbingProxy_TranslationScreenUpdater
     typealias Verification = __VerificationProxy_TranslationScreenUpdater

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenUpdater?

     func enableDefaultImplementation(_ stub: TranslationScreenUpdater) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_TranslationScreenUpdater: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_TranslationScreenUpdater: Cuckoo.VerificationProxy {
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

 class TranslationScreenUpdaterStub: TranslationScreenUpdater {
    

    

    
}



 class MockTranslationScreenBusinessLogic: TranslationScreenBusinessLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenBusinessLogic
    
     typealias Stubbing = __StubbingProxy_TranslationScreenBusinessLogic
     typealias Verification = __VerificationProxy_TranslationScreenBusinessLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenBusinessLogic?

     func enableDefaultImplementation(_ stub: TranslationScreenBusinessLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didRequestTranslate(_ request: TranslationScreenModels.Update.Request)  {
        
    return cuckoo_manager.call("didRequestTranslate(_: TranslationScreenModels.Update.Request)",
            parameters: (request),
            escapingParameters: (request),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didRequestTranslate(request))
        
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
    

	 struct __StubbingProxy_TranslationScreenBusinessLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didRequestTranslate<M1: Cuckoo.Matchable>(_ request: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Update.Request)> where M1.MatchedType == TranslationScreenModels.Update.Request {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.Request)>] = [wrap(matchable: request) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenBusinessLogic.self, method: "didRequestTranslate(_: TranslationScreenModels.Update.Request)", parameterMatchers: matchers))
	    }
	    
	    func didLoad() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenBusinessLogic.self, method: "didLoad()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TranslationScreenBusinessLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didRequestTranslate<M1: Cuckoo.Matchable>(_ request: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Update.Request), Void> where M1.MatchedType == TranslationScreenModels.Update.Request {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.Request)>] = [wrap(matchable: request) { $0 }]
	        return cuckoo_manager.verify("didRequestTranslate(_: TranslationScreenModels.Update.Request)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("didLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TranslationScreenBusinessLogicStub: TranslationScreenBusinessLogic {
    

    

    
    
    
     func didRequestTranslate(_ request: TranslationScreenModels.Update.Request)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func didLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/TranslationScreen/Presenter/TranslationScreenPresenter.swift at 2022-07-03 15:01:34 +0000

//  TranslationScreenPresenter.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import Cuckoo
@testable import CleanTranslator

import UIKit


 class MockTranslationScreenPresentationLogic: TranslationScreenPresentationLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenPresentationLogic
    
     typealias Stubbing = __StubbingProxy_TranslationScreenPresentationLogic
     typealias Verification = __VerificationProxy_TranslationScreenPresentationLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenPresentationLogic?

     func enableDefaultImplementation(_ stub: TranslationScreenPresentationLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func presentSetupScreen(_ response: TranslationScreenModels.Setup.Response)  {
        
    return cuckoo_manager.call("presentSetupScreen(_: TranslationScreenModels.Setup.Response)",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentSetupScreen(response))
        
    }
    
    
    
     func presentTranslation(_ response: TranslationScreenModels.Update.Response)  {
        
    return cuckoo_manager.call("presentTranslation(_: TranslationScreenModels.Update.Response)",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentTranslation(response))
        
    }
    
    
    
     func presentError(_ response: TranslationScreenModels.Error.Response)  {
        
    return cuckoo_manager.call("presentError(_: TranslationScreenModels.Error.Response)",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentError(response))
        
    }
    

	 struct __StubbingProxy_TranslationScreenPresentationLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func presentSetupScreen<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Setup.Response)> where M1.MatchedType == TranslationScreenModels.Setup.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Setup.Response)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenPresentationLogic.self, method: "presentSetupScreen(_: TranslationScreenModels.Setup.Response)", parameterMatchers: matchers))
	    }
	    
	    func presentTranslation<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Update.Response)> where M1.MatchedType == TranslationScreenModels.Update.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.Response)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenPresentationLogic.self, method: "presentTranslation(_: TranslationScreenModels.Update.Response)", parameterMatchers: matchers))
	    }
	    
	    func presentError<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Error.Response)> where M1.MatchedType == TranslationScreenModels.Error.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Error.Response)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenPresentationLogic.self, method: "presentError(_: TranslationScreenModels.Error.Response)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TranslationScreenPresentationLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func presentSetupScreen<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Setup.Response), Void> where M1.MatchedType == TranslationScreenModels.Setup.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Setup.Response)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("presentSetupScreen(_: TranslationScreenModels.Setup.Response)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func presentTranslation<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Update.Response), Void> where M1.MatchedType == TranslationScreenModels.Update.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.Response)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("presentTranslation(_: TranslationScreenModels.Update.Response)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func presentError<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Error.Response), Void> where M1.MatchedType == TranslationScreenModels.Error.Response {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Error.Response)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("presentError(_: TranslationScreenModels.Error.Response)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TranslationScreenPresentationLogicStub: TranslationScreenPresentationLogic {
    

    

    
    
    
     func presentSetupScreen(_ response: TranslationScreenModels.Setup.Response)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func presentTranslation(_ response: TranslationScreenModels.Update.Response)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func presentError(_ response: TranslationScreenModels.Error.Response)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/TranslationScreen/ViewControllers/TranslationScreenViewController.swift at 2022-07-03 15:01:34 +0000

//  TranslationScreenViewController.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import Cuckoo
@testable import CleanTranslator

import UIKit


 class MockTranslationScreenDisplayLogic: TranslationScreenDisplayLogic, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenDisplayLogic
    
     typealias Stubbing = __StubbingProxy_TranslationScreenDisplayLogic
     typealias Verification = __VerificationProxy_TranslationScreenDisplayLogic

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenDisplayLogic?

     func enableDefaultImplementation(_ stub: TranslationScreenDisplayLogic) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func displaySetupScreen(with viewModel: TranslationScreenModels.Setup.ViewModel)  {
        
    return cuckoo_manager.call("displaySetupScreen(with: TranslationScreenModels.Setup.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displaySetupScreen(with: viewModel))
        
    }
    
    
    
     func displayTranslatedText(_ viewModel: TranslationScreenModels.Update.ViewModel)  {
        
    return cuckoo_manager.call("displayTranslatedText(_: TranslationScreenModels.Update.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayTranslatedText(viewModel))
        
    }
    
    
    
     func displayError(_ viewModel: TranslationScreenModels.Error.ViewModel)  {
        
    return cuckoo_manager.call("displayError(_: TranslationScreenModels.Error.ViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.displayError(viewModel))
        
    }
    

	 struct __StubbingProxy_TranslationScreenDisplayLogic: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func displaySetupScreen<M1: Cuckoo.Matchable>(with viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Setup.ViewModel)> where M1.MatchedType == TranslationScreenModels.Setup.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Setup.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenDisplayLogic.self, method: "displaySetupScreen(with: TranslationScreenModels.Setup.ViewModel)", parameterMatchers: matchers))
	    }
	    
	    func displayTranslatedText<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Update.ViewModel)> where M1.MatchedType == TranslationScreenModels.Update.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenDisplayLogic.self, method: "displayTranslatedText(_: TranslationScreenModels.Update.ViewModel)", parameterMatchers: matchers))
	    }
	    
	    func displayError<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(TranslationScreenModels.Error.ViewModel)> where M1.MatchedType == TranslationScreenModels.Error.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Error.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenDisplayLogic.self, method: "displayError(_: TranslationScreenModels.Error.ViewModel)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TranslationScreenDisplayLogic: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func displaySetupScreen<M1: Cuckoo.Matchable>(with viewModel: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Setup.ViewModel), Void> where M1.MatchedType == TranslationScreenModels.Setup.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Setup.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("displaySetupScreen(with: TranslationScreenModels.Setup.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func displayTranslatedText<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Update.ViewModel), Void> where M1.MatchedType == TranslationScreenModels.Update.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Update.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("displayTranslatedText(_: TranslationScreenModels.Update.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func displayError<M1: Cuckoo.Matchable>(_ viewModel: M1) -> Cuckoo.__DoNotUse<(TranslationScreenModels.Error.ViewModel), Void> where M1.MatchedType == TranslationScreenModels.Error.ViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(TranslationScreenModels.Error.ViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("displayError(_: TranslationScreenModels.Error.ViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TranslationScreenDisplayLogicStub: TranslationScreenDisplayLogic {
    

    

    
    
    
     func displaySetupScreen(with viewModel: TranslationScreenModels.Setup.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func displayTranslatedText(_ viewModel: TranslationScreenModels.Update.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    
    
     func displayError(_ viewModel: TranslationScreenModels.Error.ViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CleanTranslator/TranslationScreen/Worker/TranslationScreenWorker.swift at 2022-07-03 15:01:34 +0000

//  TranslationScreenWorker.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//  
//

import Cuckoo
@testable import CleanTranslator


 class MockTranslationScreenWorkerProtocol: TranslationScreenWorkerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = TranslationScreenWorkerProtocol
    
     typealias Stubbing = __StubbingProxy_TranslationScreenWorkerProtocol
     typealias Verification = __VerificationProxy_TranslationScreenWorkerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: TranslationScreenWorkerProtocol?

     func enableDefaultImplementation(_ stub: TranslationScreenWorkerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var translationModelId: String {
        get {
            return cuckoo_manager.getter("translationModelId",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.translationModelId)
        }
        
    }
    

    

    
    
    
     func translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)  {
        
    return cuckoo_manager.call("translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)",
            parameters: (text, completion),
            escapingParameters: (text, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.translate(text: text, completion: completion))
        
    }
    

	 struct __StubbingProxy_TranslationScreenWorkerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var translationModelId: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockTranslationScreenWorkerProtocol, String> {
	        return .init(manager: cuckoo_manager, name: "translationModelId")
	    }
	    
	    
	    func translate<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(text: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (Result<[TranslationModel], Error>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Result<[TranslationModel], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[TranslationModel], Error>) -> Void)>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTranslationScreenWorkerProtocol.self, method: "translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TranslationScreenWorkerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var translationModelId: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "translationModelId", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func translate<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(text: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (Result<[TranslationModel], Error>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Result<[TranslationModel], Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[TranslationModel], Error>) -> Void)>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TranslationScreenWorkerProtocolStub: TranslationScreenWorkerProtocol {
        
    
    
     var translationModelId: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    

    

    
    
    
     func translate(text: String, completion: @escaping (Result<[TranslationModel], Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

