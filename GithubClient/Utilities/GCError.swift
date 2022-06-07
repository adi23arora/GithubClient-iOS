//
//  GCError.swift
//  GithubClient
//
//  Created by Aditya Arora on 07/06/22.
//

enum GCError: String, Error {
    case requestNotComplete = "Uable to complete your request. \nPlease check your internet connection."
    case invalidResponse = "Something went wrong. \nPlease try again."
    case invalidData = "Invalid response. Please try again."
    case invalidRequest = "Request URL invalid. \nPlease check."
    case undefined = "Unexpected error occurred. \nPlease try again"
}
