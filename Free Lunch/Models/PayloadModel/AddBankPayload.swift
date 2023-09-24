//
//  AddBankPayload.swift
//  Free Lunch
//
//  Created by Tes on 24/09/2023.
//

import Foundation

struct AddBankPayload: Codable {
    var bank_name: String = "GTB"
    var bank_number: String = "0201029299"
    var bank_code: String = "122"
    var bank_region: String = "Lagos"
    var currency: String = "NGN"
    var currency_code: String = "N"
}
