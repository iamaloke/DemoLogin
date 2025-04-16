//
//  DemoLoginApp.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import SwiftUI

@main
struct DemoLoginApp: App {
    
    let viewModel: LoginViewModel
    
    init() {
        let apiService = DefaultAPIService()
        let dataSource = RemoteAuthDataSource(apiService: apiService)
        let repository = AuthRepositoryImpl(remoteDataSource: dataSource)
        let loginUseCase = LoginUseCaseImpl(repository: repository)
        self.viewModel = LoginViewModel(loginUseCase: loginUseCase)
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: viewModel)
        }
    }
}
