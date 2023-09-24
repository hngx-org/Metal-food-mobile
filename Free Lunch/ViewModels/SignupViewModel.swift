//
//  SignupViewModel.swift
//  Free Lunch
//
//  Created by Tes on 24/09/2023.
//

import Foundation

class SignupViewModel: ObservableObject{
    @Published var addBankPayload = AddBankPayload()
    @Published var signupPayload = SignupPayload()
    @Published private(set) var userId : Int?
    @Published private(set) var state : SubmissionState?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError: Bool = false
    @Published private(set) var networkStatusCode : Int?
  
    @MainActor
     func signUp() async {
         await createAccount()
         if state == .successful {
             await createBankAccountForNewUser()
         }
     }
    
    @MainActor
     private func createAccount() async {
         do{
             state = .submitting
             let encoder = JSONEncoder()
             encoder.keyEncodingStrategy = .useDefaultKeys
             let data = try? encoder.encode(signupPayload)
             print("See signup payload \(signupPayload)")
             let response = try await NetworkingManager.shared.request(endpoint: .signUp(data: data), type: SignupResponseModel.self)
             self.userId = response.data?.id
             self.networkStatusCode = response.statusCode
             print("Succesful 1 \(String(describing: networkStatusCode))")
             state = .successful
         }catch{
             print("UnSuccesful 1")
             self.hasError = true
             self.state = .unsuccessful
             if let networkingError = error as? NetworkingManager.NetworkingError{
                 self.error = networkingError
             } else{
                 self.error = .custom(error: error)
             }
             print(self.error ?? .custom(error: error))
         }
         
     }
    
    @MainActor
    private func createBankAccountForNewUser() async {
         do{
             state = .submitting
             let encoder = JSONEncoder()
             encoder.keyEncodingStrategy = .useDefaultKeys
             let data = try? encoder.encode(addBankPayload)
             let response = try await NetworkingManager.shared.request(endpoint: .addBank(data: data), type: AddBankResponseModel.self)
             self.networkStatusCode = response.statusCode
             print("Succesful 2 - create bank \(String(describing: response.message))")
             state = .successful
         }catch{
             print("UnSuccesful 2")
             self.hasError = true
             self.state = .unsuccessful
             if let networkingError = error as? NetworkingManager.NetworkingError{
                 self.error = networkingError
             } else{
                 self.error = .custom(error: error)
             }
             print(self.error ?? .custom(error: error))
         }
         
     }
 }

extension SignupViewModel {
    enum SubmissionState{
        case unsuccessful
        case successful
        case submitting
    }
}
