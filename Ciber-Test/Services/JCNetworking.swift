//
//  JCNetworking.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit
import Alamofire

enum ServerResponse<T> {
    case Success(T)
    case Error(String)
}

class JCNetworking: NSObject {
    
    static var shared: JCNetworking = JCNetworking()
    var sessionManager: SessionManager = SessionManager()
    let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    // MARK: - Public methods
    
    func request(endpoint: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers:HTTPHeaders?=nil) -> DataRequest {
        
        print("🚀🚀 Requested (\(method.rawValue)): \(endpoint)")
        
        return self.sessionManager.request("\(JCQuery.urlBase)\(endpoint)", method: method, parameters: parameters, encoding: encoding)
        
    }
    
    
    // MARK: - Private Methods
}

// MARK: - Extension DataRequest
extension DataRequest {
    func responseValidatedJson(queue:DispatchQueue = DispatchQueue.main, _ completion: @escaping (JCResponse?) -> Void) {
        self.validate().responseJSON(queue: queue) { dataResponse in
            let response = JCResponse.init(code: dataResponse.response?.statusCode, dataResponse: dataResponse)
            if response.result != nil {
                print("✅ Success request: ➡️ \(dataResponse.request!)")
            }
            if response.error != nil {
                print("❌ Failure (\(String(describing: dataResponse.response?.statusCode ?? -1))) request: ➡️ \(dataResponse.request!)")
            }
            completion(response)
        }
    }
}
