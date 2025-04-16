//
//  Respository.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

protocol AuthRepository {
    func login(_ request: LoginRequest) async throws -> User
}
