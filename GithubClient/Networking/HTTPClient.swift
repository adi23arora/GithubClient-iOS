//
//  HTTPClient.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import Foundation

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {}
    
    private let session = URLSession.shared
    
    func getRequest(url: String, completion: @escaping (Result<Data, Error>?) -> Void) {
        guard let requestUrl = URL(string: url) else {return}
        session.dataTask(with: requestUrl) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(nil)
            }
        }.resume()
    }
}
