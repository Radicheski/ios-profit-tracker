//
//  NetworkWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 06/01/22.
//

import Foundation

class NetworkWorker {
    
    var url: URL?
    
    init(ticker: String) {
        self.url = URL(string: "https://radicheski-finance.herokuapp.com/b3/\(ticker)")
    }
    
    func getQuote<T: Decodable>(onSuccess: ((T) -> Void)? = nil, onError: ((Error) -> Void)? = nil) {
        if let url = self.url {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    onError?(error)
                } else if let data = data,
                          let json = try? JSONDecoder().decode(T.self, from: data) {
                    onSuccess?(json)
                }
            }
            task.resume()
        }
    }
}

