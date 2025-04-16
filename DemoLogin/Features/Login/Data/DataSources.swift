//
//  DataSources.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

final class RemoteAuthDataSource {
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func login(_ request: LoginRequestDTO) async throws -> UserResponseDTO {
        try await apiService.post("/login", data: request)
    }
}
