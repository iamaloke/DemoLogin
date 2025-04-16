//
//  LoginDataTransferObject.swift
//  DemoLogin
//
//  Created by Alok Kumar on 16/04/25.
//

import Foundation

struct UserResponseDTO: Decodable {
    let id: String
    let email: String
}

struct LoginRequestDTO: Encodable {
    let email: String
    let password: String
}
