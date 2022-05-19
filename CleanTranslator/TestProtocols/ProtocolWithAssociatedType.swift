//
//  ProtocolWithAssociatedType.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithAssociatedType {
    associatedtype T: Sequence

    var sequence: T { get }
    func methodWithType(t: T) -> Bool
}