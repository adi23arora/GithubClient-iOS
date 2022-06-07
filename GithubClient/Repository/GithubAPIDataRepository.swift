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

    func fetchClosedPR(completion: @escaping ([PullRequestResponse]?) -> Void) {
        HTTPClient.shared.getRequest(url: APIConstants.endpoint) { result in
            if case .success(let data) = result {
                do {
                    let prResponse = try JSONDecoder().decode([PullRequestResponse].self,
                                                              from: data)
                    completion(prResponse)
                } catch (let error) {
                    print("Error occured: \(error)")
                }
            }
        }
    }
}
