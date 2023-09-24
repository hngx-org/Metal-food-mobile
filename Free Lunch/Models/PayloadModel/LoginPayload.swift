//
//  PayloadModels.swift
//  Free Lunch
//
//  Created by David OH on 23/09/2023.
//

import Foundation
struct logins: Codable {
    let data: LoginResponse?
}
struct LoginPayload: Codable {
    var email: String = ""
    var password: String = ""
}

///testing without codingKeys
struct LoginResponse: Codable, Equatable{
    let accessToken : String?
    let email : String?
    let orgId : Int?
    let isAdmin : Int?
}
