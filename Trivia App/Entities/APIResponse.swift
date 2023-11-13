//
//  APIResponse.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

struct APIResponse<T: Codable>: Codable {
    let responseCode: Int
    let results: [Question]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}
