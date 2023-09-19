//
//  EndPoints.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//
//Just some placeholders
import Foundation
enum EndPoint{
    case create(submissionData: Data?), detail(id: Int), people(page: Int)
}


extension EndPoint{
    var host: String{"reqres.in"}
    var path: String{
        switch self{
        case .people,
                .create:
            return "/api/users"
        case .detail(id: let id):
            return "/api/users/\(id)"
        }}
    enum MethodType{
        
        case get
        case post(data: Data?)
        case put(data: Data?)
        case delete(data: Data?)
    }
    
    var queryItems: [String: String]? {
        switch self{
        case .people(let page):
            return ["page":"\(page)"]
        default:
            return nil
        }
    }
    
    var methodType: MethodType{
        switch self {
        case .people,
                .detail:
            return .get
        case .create(let data):
            return .post(data: data)
        }
    }
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        var requestQueryItems = queryItems?.compactMap { item in
            URLQueryItem(name: item.key, value: item.value)
        }
        urlComponents.queryItems = requestQueryItems
        return urlComponents.url
    }
    }
