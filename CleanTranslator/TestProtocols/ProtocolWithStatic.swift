//
//  ProtocolWithStatic.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

protocol ProtocolWithStatic {
    static var staticProperty: String { get }
    static func staticMethod(param: Int) throws -> Int
}
