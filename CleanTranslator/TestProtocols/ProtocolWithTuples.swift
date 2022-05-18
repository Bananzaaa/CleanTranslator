//
//  ProtocolWithTuples.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithTuples {
    func methodThatTakesTuple(tuple: (String,Int)) -> Int
}
