//
//  NetWorking Manager.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//

import Foundation

class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init(){
        
    }
    func request<T: Codable>(endpoint: EndPoint, type: T.Type) async throws  -> T{
    
        guard let url = endpoint.url else{
            throw NetworkingError.invalidUrl
        }
        
        
        let request = buildRequest(url: url, methodtype: endpoint.methodType)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode )
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let res = try decoder.decode(T.self , from: data)
        
        return res
        
    }
   
}


extension NetworkingManager {
    enum NetworkingError: LocalizedError{
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error : Error)
        
        var errorDescription: String?{
            switch self{
                
            case .invalidUrl:
                return "Url not valid"
            case .invalidStatusCode:
                return  "Invalid status code"
            case .invalidData:
                return  "Response data is invalid"
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(error: let error):
                return "Something went wrong \(error.localizedDescription)"
            }
        }
    }
    
//    enum methodType{
//        case get
//        case post(data: Data?)
//        case put(data: Data?)
//        case delete(data: Data?)
//    }
    
    
    func buildRequest (url: URL, methodtype: EndPoint.MethodType) -> URLRequest{
        var request = URLRequest(url: url)
        switch methodtype{
        case .get:
            request.httpMethod = "Get"
        case .post(let data):
            request.httpMethod = "POST"
            request.httpBody = data
        case .put(let data):
            request.httpMethod = "PUT"
            request.httpBody = data
        case .delete(let data):
            request.httpMethod = "DELETE"
            request.httpBody = data
        }
        return request
    }
}
