// MARK: - Mocks generated from file: CleanTranslator/ProtocolWithAssociatedType.swift at 2022-05-20 11:23:45 +0000

//
//  ProtocolWithAssociatedType.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.05.2022.
//

import Cuckoo
@testable import CleanTranslator

import Foundation


 class MockProtocolWithAssociatedType<T: Sequence>: ProtocolWithAssociatedType, Cuckoo.ProtocolMock {
    
     typealias MocksType = DefaultImplCaller<T>
    
     typealias Stubbing = __StubbingProxy_ProtocolWithAssociatedType
     typealias Verification = __VerificationProxy_ProtocolWithAssociatedType

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
	 class DefaultImplCaller<T: Sequence>: ProtocolWithAssociatedType {
	    private let reference: Any
	
	    private let _getter_storage$$sequence: () -> T
	     var sequence: T {
	        get { return _getter_storage$$sequence() }
	    }
	
	    
	    
	    init<_CUCKOO$$GENERIC: ProtocolWithAssociatedType>(from defaultImpl: UnsafeMutablePointer<_CUCKOO$$GENERIC>, keeping reference: @escaping @autoclosure () -> Any?) where _CUCKOO$$GENERIC.T == T {
	        self.reference = reference
	
	        _getter_storage$$sequence = { defaultImpl.pointee.sequence }
	        
	        
	        _storage$1$methodWithType = defaultImpl.pointee.methodWithType
	        
	    }
	    
	    
	
	    
	    private let _storage$1$methodWithType: (T) -> Bool
	     func methodWithType(t: T) -> Bool {
	        return _storage$1$methodWithType(t)
	    }
	    
	}

    private var __defaultImplStub: DefaultImplCaller<T>?

     func enableDefaultImplementation<_CUCKOO$$GENERIC: ProtocolWithAssociatedType>(_ stub: _CUCKOO$$GENERIC) where _CUCKOO$$GENERIC.T == T {
        var mutableStub = stub
        __defaultImplStub = DefaultImplCaller(from: &mutableStub, keeping: mutableStub)
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func enableDefaultImplementation<_CUCKOO$$GENERIC: ProtocolWithAssociatedType>(mutating stub: UnsafeMutablePointer<_CUCKOO$$GENERIC>) where _CUCKOO$$GENERIC.T == T {
        __defaultImplStub = DefaultImplCaller(from: stub, keeping: nil)
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var sequence: T {
        get {
            return cuckoo_manager.getter("sequence",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sequence)
        }
        
    }
    

    

    
    
    
     func methodWithType(t: T) -> Bool {
        
    return cuckoo_manager.call("methodWithType(t: T) -> Bool",
            parameters: (t),
            escapingParameters: (t),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.methodWithType(t: t))
        
    }
    

	 struct __StubbingProxy_ProtocolWithAssociatedType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sequence: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockProtocolWithAssociatedType, T> {
	        return .init(manager: cuckoo_manager, name: "sequence")
	    }
	    
	    
	    func methodWithType<M1: Cuckoo.Matchable>(t: M1) -> Cuckoo.ProtocolStubFunction<(T), Bool> where M1.MatchedType == T {
	        let matchers: [Cuckoo.ParameterMatcher<(T)>] = [wrap(matchable: t) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockProtocolWithAssociatedType.self, method: "methodWithType(t: T) -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ProtocolWithAssociatedType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sequence: Cuckoo.VerifyReadOnlyProperty<T> {
	        return .init(manager: cuckoo_manager, name: "sequence", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func methodWithType<M1: Cuckoo.Matchable>(t: M1) -> Cuckoo.__DoNotUse<(T), Bool> where M1.MatchedType == T {
	        let matchers: [Cuckoo.ParameterMatcher<(T)>] = [wrap(matchable: t) { $0 }]
	        return cuckoo_manager.verify("methodWithType(t: T) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ProtocolWithAssociatedTypeStub<T: Sequence>: ProtocolWithAssociatedType {
        
    
    
     var sequence: T {
        get {
            return DefaultValueRegistry.defaultValue(for: (T).self)
        }
        
    }
    

    

    
    
    
     func methodWithType(t: T) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
}

