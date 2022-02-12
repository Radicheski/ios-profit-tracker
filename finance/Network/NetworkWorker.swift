//
//  NetworkWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

class NetworkWorker {
    
    private static var cache = URLCache.shared
    
    var url: URL?
    
    init(ticker: String) {
        self.url = URL(string: "https://radicheski-finance.herokuapp.com/b3/\(ticker)")
    }
    
    func getQuote<T: Decodable>(onSuccess: ((T) -> Void)? = nil, onError: ((Error) -> Void)? = nil) {
        if let url = self.url {
            let request = URLRequest(url: url)
            if let response = Self.cache.cachedResponse(for: request),
               let json = try? JSONDecoder().decode(T.self, from: response.data) {
                    onSuccess?(json)
            } else {
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        onError?(error)
                    } else if let data = data,
                              let response = response,
                              let json = try? JSONDecoder().decode(T.self, from: data) {
                        Self.cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
                        onSuccess?(json)
                    }
                }
                task.resume()
            }
        }
    }
    
}
