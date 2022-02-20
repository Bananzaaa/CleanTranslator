//
//  TranslationEndpoint.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Apexy

struct TranslationEndpoint: JsonEndpoint, URLRequestBuildable {
    
    typealias Content = TranslationResponse
    
    private let translationRequest: TranslationRequest
    
    init(request: TranslationRequest) {
        translationRequest = request
    }
    
    func makeRequest() throws -> URLRequest {
        let url = URL(string: "v3/translate?version=2019-09-07")!
        return post(url, body: .json(try JSONEncoder.default.encode(translationRequest)))
    }
}
