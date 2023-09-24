//
//  LoginResponseModel.swift
//  Free Lunch
//
//  Created by Tes on 24/09/2023.
//

import Foundation

struct logins: Codable {
    let statusCode: Int?
    let data: LoginResponse?
}

///testing without codingKeys
struct LoginResponse: Codable, Equatable{
    let accessToken : String?
    let email : String?
    let orgId : Int?
    let isAdmin : Int?
}
