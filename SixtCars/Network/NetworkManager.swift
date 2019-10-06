//
//  NetworkManager.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import Alamofire

extension HttpRequestMethod {
    var mapping: HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }
}

class NetworkManager: NSObject {

    static let sharedInstance = NetworkManager()
    
    var connectedToInternet: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func perfromRequest <T : Codable>(request:RequestProtocol, of type: T.Type, completion: @escaping (AnyObject?) -> Void,errorHandler: @escaping (NetworkError) -> Void) {
        
        if !connectedToInternet {
            print("Not Connected To Internet")
            errorHandler(NetworkError.noInternetConnection)
            return
        }
        
        let url = URL(string: request.url)!
        let headers = request.headers
        let paramters = request.paramters
        let httpMethod = request.method.mapping
        
        Alamofire.request(url
            , method: httpMethod
            , parameters: paramters
            , encoding: JSONEncoding.default
            , headers: headers).validate().responseJSON { (response) -> Void in
                
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result.value ?? "")")
                
                guard response.result.isSuccess else {
                    let errorMessage = String(describing: response.result.error)
                    print("Error while fetching: \(errorMessage)")
                    errorHandler(NetworkError.other)
                    return
                }
                
                do{
                    if let data = try? JSONSerialization.data(withJSONObject: response.result.value!, options: .prettyPrinted) {
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(type, from: data)
                        completion(model as AnyObject)
                    }
                }
                catch {
                    errorHandler(NetworkError.custom(error.localizedDescription))
                }
        }
    }
}
