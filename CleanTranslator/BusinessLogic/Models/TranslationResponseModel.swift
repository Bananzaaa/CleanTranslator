//
//  TranslationResponseModel.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation

struct TranslationResponseModel: Codable {
    let translations: [TranslationAPIModel]
    let wordCount: Int
    let characterCount: Int
}

struct TranslationAPIModel: Codable {
    let translation: String
}

extension TranslationResponseModel {
    static func mock() -> TranslationResponseModel {
        TranslationResponseModel(
            translations: [TranslationAPIModel(translation: "Ну здрасьте")],
            wordCount: 1,
            characterCount: 11)
    }
}
