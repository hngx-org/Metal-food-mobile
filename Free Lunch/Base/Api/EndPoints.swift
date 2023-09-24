//
//  EndPoints.swift
//  Free Lunch
//
//  Created by David OH on 19/09/2023.
//
//Just some placeholders
import Foundation
enum EndPoint{
//    case create(submissionData: Data?)
    case detail(id: Int)
    case people(page: Int)
    case create(loginData: Data?)
}


extension EndPoint{
    var host: String{"titans-food-backend.onrender.com"}
    var path: String{
        switch self{
        case .people,
                .create:
            return "/api/v1/auth/user/signin"
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
        let requestQueryItems = queryItems?.compactMap { item in
            URLQueryItem(name: item.key, value: item.value)
        }
        urlComponents.queryItems = requestQueryItems
        return urlComponents.url
    }
    }
/////
//func fetchTrivia() async {
//    guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
//    
//    let urlRequest = URLRequest(url: url)
//    
//    do {
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//        
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//
//        let decoder = JSONDecoder()
//        // Line below allows us to convert the correct_answer key from the API into the correctAnswer in our Trivia model, without running into an error from the JSONDecoder that it couldn't find a matching codingKey
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let decodedData = try decoder.decode(Trivia.self, from: data)
//
//        DispatchQueue.main.async {
//            // Reset variables before assigning new values, for when the user plays the game another time
//            self.index = 0
//            self.score = 0
//            self.progress = 0.00
//            self.reachedEnd = false
//
//            // Set new values for all variables
//            self.trivia = decodedData.results
//            self.length = self.trivia.count
//            self.setQuestion()
//        }
//    } catch {
//        print("Error fetching trivia: \(error)")
//    }
//}
