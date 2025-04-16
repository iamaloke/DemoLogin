//
//  APIService.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import Foundation

protocol APIService {
    func post<T: Decodable, U: Encodable>(_ endpoint: String, data: U) async throws -> T
}

final class DefaultAPIService: APIService {
    func post<T, U>(_ endpoint: String, data: U) async throws -> T where T : Decodable, U : Encodable {
        guard let url = URL(string: "https://api.example.com" + endpoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(data)
        
        let (responseData, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(T.self, from: responseData)
    }
}
