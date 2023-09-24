//
//  LoginVM.swift
//  Free Lunch
//
//  Created by David OH on 23/09/2023.
//


import SwiftUI

//class AuthViewModel: ObservableObject {
//    @AppStorage("accessToken") var accessToken: String?
//
//    static let shared = AuthViewModel()
//}
//let authViewModel = AuthViewModel.shared
////let anotherViewModel = AnotherViewModel(authViewModel: authViewModel)
//let token = authViewModel.accessToken // Access token is available here

///
///


import Foundation

class LoginVM: ObservableObject{
    @Published var person = LoginPayload()
    @Published private(set) var userInfo : LoginResponse?
    @Published private(set) var state : SubmissionState?
    @Published private(set) var error: NetworkingManager.NetworkingError?
//    @Published var hasError: Bool = false
    
//    private let validator = Validator()
    
    @MainActor
    func loginUser() async{
        do{
//            try validator.validate(person: person)
            
            state = .submitting
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .useDefaultKeys
            let data = try? encoder.encode(person)
            self.userInfo = try await NetworkingManager.shared.request(endpoint: .create(loginData: data), type: logins.self).data
            print("Succesful")

            if let accessToken = self.userInfo?.accessToken {
                UserDefaults.standard.setValue(self.userInfo?.accessToken, forKey: "accessToken")
                        }
            state = .successful
        }catch{
            print("UnSuccesful")
            self.state = .unsuccessful
            if let networkingError = error as? NetworkingManager.NetworkingError{
                self.error = networkingError
            } else{
                self.error = .custom(error: error)
            }
            print(self.error)
        }
        
    }
}

//func request(endpoint: EndPoint) async throws {
//
//    guard let url = endpoint.url else{
//        throw NetworkingError.invalidUrl
//    }
//
//    let request = buildRequest(url: url, methodtype: endpoint.methodType)
//
//    let (_, response) = try await URLSession.shared.data(for: request)
//
//    dump(String(data:request.httpBody!,encoding: .utf8))
//    guard let response = response as? HTTPURLResponse,
//          (200...300) ~= response.statusCode else {
//        let statusCode = (response as! HTTPURLResponse).statusCode
//        throw NetworkingError.invalidStatusCode(statusCode: statusCode )
//    }
//}



//func sendPostRequest(person :  LoginPayload) async throws{
//
//        guard let url = URL(string: "https://titans-food-backend.onrender.com/api/v1/auth/user/signin") else {
//            throw NetworkingManager.NetworkingError.invalidUrl
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        do {
//            let jsonBody = try? JSONEncoder().encode(person)
//            request.httpBody = jsonBody
//
//            dump(String(data:jsonBody!,encoding: .utf8))
//        } catch {
//            throw NetworkingManager.NetworkingError.invalidData
//        }
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//    guard let response = response as? HTTPURLResponse,
//          (200...300) ~= response.statusCode else {
//        let statusCode = (response as! HTTPURLResponse).statusCode
//        dump((response as! HTTPURLResponse))
//        throw NetworkingManager.NetworkingError.invalidStatusCode(statusCode: statusCode )
//    }
//


///
///
///
///

extension LoginVM {
    enum SubmissionState{
        case unsuccessful
        case successful
        case submitting
    }
}
