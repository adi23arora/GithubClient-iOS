//
//  UIView+Extension.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

import UIKit

extension UIView {
    func pinToEdges(of superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }

    func pinToEdges(of superView: UIView, margin: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: margin),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: margin),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -margin),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -margin)
        ])
    }
}
