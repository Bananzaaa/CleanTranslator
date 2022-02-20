//
//  ServiceLayer.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 14.02.2022.
//

import Apexy
import Foundation

final class ServiceLayer {
    
    // MARK: - Init
    
    private init() {}
    static let shared = ServiceLayer()
    
    // MARK: - Private properties
    
    private let baseUrl = URL(string: "https://gateway-lon.watsonplatform.net/language-translator/api")!
    private lazy var interceptor = RequestInterceptor(baseURL: baseUrl, apiKey: nil)
    
    // MARK: - Public properties
    
    private(set) lazy var apiClient: Client = {
        AlamofireClient(
            requestInterceptor: interceptor,
            configuration: .ephemeral)
    }()
    
    // MARK: - Services
    
    private(set) lazy var translationService: TranslationService = MainTranslationService(apiClient: apiClient)
}
