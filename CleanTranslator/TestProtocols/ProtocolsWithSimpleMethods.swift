//
//  ProtocolsWithSimpleMethods.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

protocol ProtocolsWithSimpleMethods {
    func simpleMethodThatReturns() -> Int
    func simpleMethodThatReturns(param: String) -> String
    func simpleMethodThatReturns(optionalParam: String?) -> String?
}
