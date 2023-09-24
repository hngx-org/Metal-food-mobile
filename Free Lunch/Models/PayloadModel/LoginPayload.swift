//
//  PayloadModels.swift
//  Free Lunch
//
//  Created by David OH on 23/09/2023.
//

import Foundation

struct LoginPayload: Codable {
    var email: String = ""
    var password: String = ""
}
