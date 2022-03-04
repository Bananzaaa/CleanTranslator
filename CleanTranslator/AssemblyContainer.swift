//
//  AssemblyContainer.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 04.03.2022.
//

import Foundation

final class AssemblyContainer {
    private static let container = Container()
    
    enum Factories {
        static func alertsFactory() -> AlertFactory {
            container.alertsFactory
        }
    }
    
    private class Container {
        lazy var alertsFactory = MainAlertFactory()
    }
}
