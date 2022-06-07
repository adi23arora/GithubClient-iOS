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
    
    func getRequest(url: String, completion: @escaping (Result<Data, GCError>?) -> Void) {
        guard let requestUrl = URL(string: url) else {
            completion(.failure(.invalidRequest))
            return
        }

        session.dataTask(with: requestUrl) { data, response, error in
            if let _ = error {
                completion(.failure(.requestNotComplete))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
