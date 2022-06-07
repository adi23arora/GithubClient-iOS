//
//  ClosedPRListViewModel.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import Foundation

protocol ClosedPRListViewModelDelegate: AnyObject {
    func updateClosedPRData(with data: [PullRequest]?, error: GCError?)
}

class ClosedPRListViewModel {
    private let repository = GithubAPIDataRepository()
    weak var delegate: ClosedPRListViewModelDelegate?

    func parseClosedPRData() {
        var prData = [PullRequest]()
        repository.fetchClosedPR { [weak self] (data, error) in
            guard let data = data else {
                self?.delegate?.updateClosedPRData(with: nil, error: error)
                return
            }

            prData = data.map({ PullRequest(title: $0.title,
                                            username: $0.user.username,
                                            userImageUrl: $0.user.imageUrl,
                                            createdDate: $0.createdAt.components(separatedBy: "T")[0],
                                            closedDate: $0.updatedAt.components(separatedBy: "T")[0]) })
            DispatchQueue.main.async {
                self?.delegate?.updateClosedPRData(with: prData, error: nil)
            }
        }
    }
}
