//
//  Repositories.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

final class AuthRepositoryImpl: AuthRepository {
    private let remoteDataSource: RemoteAuthDataSource
    
    init(remoteDataSource: RemoteAuthDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(_ request: LoginRequest) async throws -> User {
        let dto = LoginRequestDTO(email: request.email, password: request.password)
        let response = try await remoteDataSource.login(dto)
        return User(id: response.id, email: response.email)
    }
}
