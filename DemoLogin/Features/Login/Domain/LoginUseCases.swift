//
//  LoginUseCases.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

protocol LoginUseCase {
    func execute(_ request: LoginRequest) async throws -> User
}

final class LoginUseCaseImpl: LoginUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(_ request: LoginRequest) async throws -> User {
        try await repository.login(request)
    }
}
