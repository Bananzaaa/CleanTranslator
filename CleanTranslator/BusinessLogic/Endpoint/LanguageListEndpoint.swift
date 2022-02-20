//
//  LanguageListEndpoint.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 20.02.2022.
//

import Foundation
import Apexy

struct LanguageListEndpoint: JsonEndpoint, URLRequestBuildable {
    typealias Content = String
    
    func makeRequest() throws -> URLRequest {
        let url = URL(string: "v3/languages")!
        let queryItem = URLQueryItem(name: "version", value: "2019-09-07")
        return get(url, queryItems: [queryItem])
    }
}
