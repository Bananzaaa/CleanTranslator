//
//  ProtocolsWithSimpleMethods.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolsWithSimpleMethods {
    func simpleMethodThatReturns() -> Int
    func simpleMethodThatReturns(param: String) -> String
    func simpleMethodThatReturns(optionalParam: String?) -> String?
}
