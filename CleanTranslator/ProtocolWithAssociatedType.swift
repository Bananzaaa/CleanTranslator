//
//  ProtocolWithAssociatedType.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.05.2022.
//

import Foundation

protocol ProtocolWithAssociatedType {
    associatedtype T: Sequence

    var sequence: T { get }
    func methodWithType(t: T) -> Bool
}
