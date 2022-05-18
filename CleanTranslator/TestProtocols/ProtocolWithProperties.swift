//
//  ProtocolWithProperties.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithProperties {
    var someGetSetProperty: Int { get set }
    var someGetProperty: String { get }
}
