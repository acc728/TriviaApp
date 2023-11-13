//
//  URLSessionNetworkClient.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

import Foundation

class URLSessionNetworkClient: NetworkClient {
    func get<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkClientError.badUrl
        }
        let data = try await URLSession.shared.data(from: url).0
        return try JSONDecoder().decode(T.self, from: data)
    }
}
