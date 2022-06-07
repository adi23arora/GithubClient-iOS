//
//  PullRequestCell.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import UIKit

class PullRequestCell: UITableViewCell {
    
    struct LayoutConstants {
        static let containerPadding = 5.0
        static let elementsPadding = 10.0
        static let imageSize = 80.0
        static let titleLabelFontSize = 20.0
        static let labelsFontSize = 18.0
        static let imageAndStackViewMargin = 50.0
        static let stackElementsSpacing = 6.0
        static let containerCornerRadius = 10.0
    }

    private var containerView = UIView()
    private var userImageView = LazyImageView()
    private var userNameLabel = UILabel()
    private var titleLabel = UILabel()
    private var createdAtLabel = UILabel()
    private var closedAtLabel = UILabel()
    private var detialsStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(pullRequest: PullRequest) {
        titleLabel.text = pullRequest.title
        userNameLabel.text = "Author: " + pullRequest.username
        createdAtLabel.text = "Created At: " + pullRequest.createdDate
        closedAtLabel.text = "Closed At: " + pullRequest.closedDate
        if let imageUrl = URL(string: pullRequest.userImageUrl) {
            userImageView.loadImage(fromUrl: imageUrl,
                                    placeholderImage: Constants.Image.placeholder)
        }
    }

    private func configureSubViews() {
        contentView.addSubview(containerView)
        containerView.pinToEdges(of: contentView, margin: LayoutConstants.containerPadding)
        containerView.layer.cornerRadius = LayoutConstants.containerCornerRadius
        containerView.backgroundColor = .systemGray6
        
        configureTitleLabel()
        configureUserImageView()
        configureDetailsStackView()
    }

    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: LayoutConstants.titleLabelFontSize)
        titleLabel.adjustsFontSizeToFitWidth = true
        setTitleLabelConstraints()
    }

    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,
                                            constant: LayoutConstants.elementsPadding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                constant: LayoutConstants.elementsPadding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                 constant: -LayoutConstants.elementsPadding)
        ])
    }

    private func configureUserImageView() {
        containerView.addSubview(userImageView)
        userImageView.layer.cornerRadius = LayoutConstants.imageSize / 2
        userImageView.clipsToBounds = true
        setUserImageViewConstraints()
    }

    private func setUserImageViewConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant: LayoutConstants.elementsPadding * 2),
            userImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.imageSize),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor),
            userImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                   constant: LayoutConstants.elementsPadding),
            userImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                  constant: -LayoutConstants.elementsPadding)
        ])
    }

    private func configureDetailsStackView() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        closedAtLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .systemFont(ofSize: LayoutConstants.labelsFontSize)
        createdAtLabel.font = .systemFont(ofSize: LayoutConstants.labelsFontSize)
        closedAtLabel.font = .systemFont(ofSize: LayoutConstants.labelsFontSize)
        
        containerView.addSubview(detialsStackView)
        detialsStackView.translatesAutoresizingMaskIntoConstraints = false
        detialsStackView.axis = .vertical
        detialsStackView.alignment = .fill
        detialsStackView.distribution = .fill
        detialsStackView.spacing = LayoutConstants.stackElementsSpacing
        
        detialsStackView.addArrangedSubview(userNameLabel)
        detialsStackView.addArrangedSubview(createdAtLabel)
        detialsStackView.addArrangedSubview(closedAtLabel)
        
        NSLayoutConstraint.activate([
            detialsStackView.topAnchor.constraint(equalTo: userImageView.topAnchor),
            detialsStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor,
                                                      constant: LayoutConstants.imageAndStackViewMargin),
            detialsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                     constant: -LayoutConstants.elementsPadding)
        ])
    }
}

