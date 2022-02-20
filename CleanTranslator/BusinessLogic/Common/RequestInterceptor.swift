//
//  RequestInterceptor.swift
//  CleanTranslator
//
//  Created by Stanislav Anatskii on 14.02.2022.
//

import Alamofire
import Apexy
import Foundation

final class RequestInterceptor: Alamofire.RequestInterceptor {
    
    // MARK: - Private properties
    
    private let baseURL: URL
    private let apiKey: String?
    
    // MARK: - Init
    
    init(baseURL: URL, apiKey: String?) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    // MARK: - Public methods
    
    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void) {
            
        guard
            let url = urlRequest.url,
                let apiKey = apiKey
        else {
            return
        }
        
        var request = urlRequest
        request.url = appendingBaseURL(to: url)
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        
        completion(.success(request))
    }
    
    public func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void) {
            
        completion(.doNotRetry)
    }
    
    // MARK: - Private methods
    
    private func appendingBaseURL(to url: URL) -> URL {
        URL(string: url.absoluteString, relativeTo: baseURL)!
    }
}
