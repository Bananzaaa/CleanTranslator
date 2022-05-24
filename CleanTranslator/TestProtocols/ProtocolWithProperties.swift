//
//  ProtocolWithProperties.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

protocol ProtocolWithProperties {
    var someGetSetProperty: Int { get set }
    var someGetProperty: String { get }
}
