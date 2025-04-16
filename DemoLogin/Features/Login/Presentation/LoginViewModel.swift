//
//  LoginViewModel.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var user: User?
    @Published var errorMessage: String?
    
    private let loginUseCase: LoginUseCase
    private var resetTask: Task<Void, Never>? = nil
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    private func reset() {
        resetTask?.cancel()
        resetTask = Task {
            try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            self.errorMessage = nil
        }
    }
    
    func login() {
        guard !username.isEmpty else {
            self.errorMessage = "Please enter email"
            reset()
            return
        }
        
        guard !password.isEmpty else {
            self.errorMessage = "Please enter passwoed"
            reset()
            return
        }
        
        Task {
            do {
                let request = LoginRequest(email: username, password: password)
                let user = try await loginUseCase.execute(request)
                self.user = user
            } catch {
                self.errorMessage = "Login failed: \(error.localizedDescription)"
                self.reset()
            }
        }
    }
}
