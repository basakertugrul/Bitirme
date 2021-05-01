//
//  Services.swift
//  Bitirme
//
//  Created by Başak Ertuğrul on 27.04.2021.
//

import Foundation
import Alamofire

enum HTTPRequestMethod {
    case get
    case post
    case delete
    case put
    
    var afMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .delete:
            return .delete
        case .put:
            return .put
        }
    }
}

typealias RequestCompletionBlock = (_ data: [String: Any]?, _ error: String?) -> ()

struct NetworkManager {
    static func sendrequest(urlStr: String,
                       httpMethod: HTTPRequestMethod,
                       parameters: [String: Any],
                       completion: @escaping RequestCompletionBlock) {
        AF.request(urlStr,
                   method: httpMethod.afMethod,
                   parameters: parameters)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    if let value = data as? [String: Any] {
                        completion(value, nil)
                    } else {
                        completion(nil, "Decode error")
                    }
                case .failure(let error):
                    print("AF Error \(error.localizedDescription)")
                    completion(nil, error.localizedDescription)
                }
            }
    }

}
