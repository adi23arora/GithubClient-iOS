//
//  PullRequestResponse.swift
//  GithubClient
//
//  Created by Aditya Arora on 06/06/22.
//

struct PullRequestResponse: Codable {
    let title: String
    let createdAt: String
    let updatedAt: String
    let user: UserData

    enum CodingKeys: String, CodingKey {
        case title, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct UserData: Codable {
    let username: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case username = "login"
        case imageUrl = "avatar_url"
    }
}
