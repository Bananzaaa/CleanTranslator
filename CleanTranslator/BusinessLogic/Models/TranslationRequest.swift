//
//  TranslationRequest.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation

struct TranslationRequest: Codable {
    let text: [String]
    let modelId: String
}
