//
//  ProtocolWithMethodThatThrows.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithMethodThatThrows {
    func methodThatThrows() throws
    func methodThatReturnsAndThrows(param: Int) throws -> Bool
}
