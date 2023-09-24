//
//  SignupPayload.swift
//  Free Lunch
//
//  Created by Tes on 24/09/2023.
//

import Foundation

// MARK: - SignupResponseModel
struct SignupResponseModel: Codable {
    let statusCode: Int?
    let status, message: String?
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case status, message, data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let firstName, lastName, email: String?
    let isAdmin: Bool?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case isAdmin = "is_admin"
        case id
    }
}
