//
//  ProtocolWithGeneric.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithGeneric {
    func methodWithGeneric<T>(lhs: T, rhs: T) -> Bool
    func methodWithGenericConstraint<U>(param: [U]) -> U where U: Equatable
}
