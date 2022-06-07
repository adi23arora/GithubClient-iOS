//
//  GithubAPIDataRepository.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import Foundation

class GithubAPIDataRepository: GithubAPIResouceRepository {
    struct APIConstants {
        static let endpoint = "https://api.github.com/repos/twbs/bootstrap/pulls?state=closed"
    }

    func fetchClosedPR(completion: @escaping ([PullRequestResponse]?, GCError?) -> Void) {
        HTTPClient.shared.getRequest(url: APIConstants.endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let prResponse = try JSONDecoder().decode([PullRequestResponse].self,
                                                              from: data)
                    completion(prResponse, nil)
                } catch {
                    completion(nil, .invalidData)
                }
            case .failure(let data):
                completion(nil, data)
            case .none:
                completion(nil, .undefined)
            }
        }
    }
}
