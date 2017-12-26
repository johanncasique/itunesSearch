//
//  JCResponse.swift
//  Ciber-Test
//
//  Created by johann casique on 21/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import Alamofire

enum JCReponseErrors: Int {
    case success =  200
    case fail = 401
}

struct JCResponse {
    
    var statusCode:Int?
    var result:Result<[String:Any]>?
    var error:Error?
    var errorJson:[String:Any]?
    
    init(code:Int?, dataResponse:DataResponse<Any>?) {
        statusCode = code ?? 450
        if (dataResponse?.result.isSuccess)! {
            guard let value = dataResponse?.result.value as? [String : Any] else {return}
            result = Result.success(value)
        } else if (dataResponse?.result.isFailure)! {
            error = dataResponse?.error
            do {
                guard let data = dataResponse?.data else {return}
                errorJson = try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.allowFragments, JSONSerialization.ReadingOptions.mutableLeaves, JSONSerialization.ReadingOptions.mutableContainers]) as? [String:AnyObject]
            } catch _ {
                print(error as Any)
            }
        }
    }
}
