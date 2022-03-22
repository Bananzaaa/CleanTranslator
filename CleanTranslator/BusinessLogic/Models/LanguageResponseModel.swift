//
//  LanguageResponseModel.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation

struct LanguageResponseModel: Codable {
    let languages: [LanguageAPIModel]
}

struct LanguageAPIModel: Codable {
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

extension LanguageResponseModel {
    static func mock() -> LanguageResponseModel {
        LanguageResponseModel(
            languages: [
                LanguageAPIModel(
                    language: "ru",
                    languageName: "russian",
                    nativeLanguageName: "Русский",
                    countryCode: "ru",
                    wordsSeparated: false,
                    direction: "ltr",
                    supportedAsSource: false,
                    supportedAsTarget: false,
                    identifiable: false),
                LanguageAPIModel(
                    language: "en",
                    languageName: "english",
                    nativeLanguageName: "English",
                    countryCode: "en",
                    wordsSeparated: false,
                    direction: "ltr",
                    supportedAsSource: false,
                    supportedAsTarget: false,
                    identifiable: false),
                LanguageAPIModel(
                    language: "uk",
                    languageName: "Ukrainian",
                    nativeLanguageName: "Українська",
                    countryCode: "uk",
                    wordsSeparated: false,
                    direction: "ltr",
                    supportedAsSource: false,
                    supportedAsTarget: false,
                    identifiable: false)
            ])
    }
}
