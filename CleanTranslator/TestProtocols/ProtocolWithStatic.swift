//
//  ProtocolWithStatic.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithStatic {
    static var staticProperty: String { get }
    static func staticMethod(param: Int) throws -> Int
}
