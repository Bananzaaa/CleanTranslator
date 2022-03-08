//
//  ServicesAssemblyContainer.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 07.03.2022.
//

import Foundation

final class ServicesAssemblyContainer {
    private static let container = Container()
    
    enum Services {
        static func translationService() -> TranslationService {
            container.translationService
        }
    }
    
    private class Container {
        lazy var translationService = ServiceLayer.shared.translationService
    }
}
