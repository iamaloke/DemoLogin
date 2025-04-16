//
//  ContentView.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(text: $username) {
                        Text("Email")
                    }
                    .padding(.vertical, 10)
                    
                    SecureField(text: $password) {
                        Text("Password")
                    }
                    .padding(.vertical, 10)
                    
                    Button {
                        
                    } label: {
                        Text("Submit")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.vertical, 10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
