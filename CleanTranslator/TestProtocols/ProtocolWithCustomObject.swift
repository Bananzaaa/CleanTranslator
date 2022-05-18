//
//  ProtocolWithCustomObject.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 18.05.2022.
//

import Foundation

//sourcery: AutoMockable
protocol ProtocolWithCustomObject {
    func methodThatTakesUser(user: UserObject) throws
    func methodThatTakesArrayOfUsers(array: [UserObject]) -> Int
}
