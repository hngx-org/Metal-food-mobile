//
//  SignupPayload.swift
//  Free Lunch
//
//  Created by Tes on 24/09/2023.
//

import Foundation

struct SignupPayload: Codable {
    var first_name : String = ""
    var last_name : String = ""
    var email : String = ""
    var password : String = ""
}
