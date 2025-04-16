//
//  LoginView.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(text: $viewModel.username) {
                        Text("Email")
                    }
                    .padding(.vertical, 10)
                    
                    SecureField(text: $viewModel.password) {
                        Text("Password")
                    }
                    .padding(.vertical, 10)
                    
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Submit")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical, 10)
                    .disabled(!(viewModel.errorMessage ?? "").isEmpty)
                    
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundColor(.red)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    let apiService = DefaultAPIService()
    let dataSource = RemoteAuthDataSource(apiService: apiService)
    let repository = AuthRepositoryImpl(remoteDataSource: dataSource)
    let loginUseCase = LoginUseCaseImpl(repository: repository)
    let viewModel = LoginViewModel(loginUseCase: loginUseCase)
    LoginView(viewModel: viewModel)
}
