//
//  ProtocolWithMethodThatThrows.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 24.05.2022.
//

import Foundation

protocol ProtocolWithMethodThatThrows {
    func methodThatThrows() throws
    func methodThatReturnsAndThrows(param: Int) throws -> Bool
}
