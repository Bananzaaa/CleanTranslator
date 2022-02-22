//
//  TranslationService.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 14.02.2022.
//

import Foundation

protocol TranslationService: AnyObject {
    func translate(with request: TranslationRequest) -> Progress
}

final class MainTranslationService: APIService, TranslationService {
    
    func translate(with request: TranslationRequest) -> Progress {
        apiClient.request(TranslationEndpoint(request: request)) { result in
            print(result)
        }
    }
}
