//
//  ViewController.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import UIKit

class PRListViewController: UIViewController {

    private let tableView = UITableView()
    private let progressView = UIActivityIndicatorView()
    
    private var pullRequestData = [PullRequest]()
    private var viewModel = ClosedPRListViewModel()
    
    struct LayoutConstants {
        static let cellRowHeight = 180.0
    }
    
    struct Cells {
        static let pullRequestCell = "PullRequestCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = "Closed Pull Requests"
        configureTableView()
        configureProgressView()
        fetchClosedPRData()
    }

    private func fetchClosedPRData() {
        viewModel.parseClosedPRData()
        showProgress()
    }

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.pinToEdges(of: view)
        setTableViewDelegates()
        tableView.register(PullRequestCell.self,
                           forCellReuseIdentifier: Cells.pullRequestCell)
        tableView.rowHeight = LayoutConstants.cellRowHeight
    }

    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureProgressView() {
        view.addSubview(progressView)
        progressView.pinToEdges(of: view)
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func showProgress() {
        progressView.startAnimating()
        view.isUserInteractionEnabled = false
    }

    private func hideProgress() {
        progressView.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}

extension PRListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.pullRequestCell,
                                                 for: indexPath) as! PullRequestCell
        cell.setData(pullRequest: pullRequestData[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PRListViewController: ClosedPRListViewModelDelegate {
    func updateClosedPRData(with data: [PullRequest]?, error: GCError? = nil) {
        if let data = data {
            pullRequestData = data
            hideProgress()
            tableView.reloadData()
        } else if let error = error {
            presentAlert(title: "Error",
                         message: error.rawValue,
                         buttonTitle: "Retry") { [weak self] in
                self?.fetchClosedPRData()
            }
        }
    }
}
