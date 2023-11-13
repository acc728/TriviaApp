//
//  NetworkClientError.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

enum NetworkClientError: Error {
    case badUrl
    case noResults
    case invalidParameters
    case tokenNotFound
    case tokenEmpty
}
