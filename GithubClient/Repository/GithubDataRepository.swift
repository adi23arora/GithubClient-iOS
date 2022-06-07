//
//  GithubDataRepository.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

protocol GithubDataRepository {
    func fetchClosedPR(completion: @escaping ([PullRequestResponse]?, GCError?) -> Void)
}

protocol GithubAPIResouceRepository: GithubDataRepository {
    //
}
