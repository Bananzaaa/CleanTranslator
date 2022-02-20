//
//  LaguageModel.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation

struct LanguageResponse: Codable {
    let languages: [Language]
}

struct Language: Codable {
    let language: String
    let languageName: String
    let nativeLanguageName: String
    let countryCode: String
    let wordsSeparated: Bool
    let direction: String
    let supportedAsSource: Bool
    let supportedAsTarget: Bool
    let identifiable: Bool
}
