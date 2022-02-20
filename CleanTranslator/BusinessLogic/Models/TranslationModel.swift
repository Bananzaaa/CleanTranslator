//
//  TranslationModel.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation

struct TranslationResponse: Codable {
    let translations: [Translation]
    let wordCount: Int
    let characterCount: Int
}

struct Translation: Codable {
    let translation: String
}
