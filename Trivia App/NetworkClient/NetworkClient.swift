//
//  NetworkClient.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

protocol NetworkClient {
    func get<T: Decodable>(url: String) async throws -> T
}
