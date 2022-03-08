//
//  LanguageModel.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 27.02.2022.
//

import Foundation

struct LanguageModel: Codable {
    let language: String
    let languageName: String
    let nativeLanguageName: String
    let countryCode: String
    let wordsSeparated: Bool
    let direction: String
    let supportedAsSource: Bool
    let supportedAsTarget: Bool
    let identifiable: Bool
    
    init(from model: LanguageAPIModel) {
        language = model.language
        languageName = model.languageName
        nativeLanguageName = model.nativeLanguageName
        countryCode = model.countryCode
        wordsSeparated = model.wordsSeparated
        direction = model.direction
        supportedAsSource = model.supportedAsSource
        supportedAsTarget = model.supportedAsTarget
        identifiable = model.identifiable
    }
}
