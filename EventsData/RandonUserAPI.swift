//
//  RandonUserAPI.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 7/19/15.
//  Copyright © 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import Alamofire

enum RandomUserRouter : URLRequestConvertible {
    static let baseURLString = "https://randomuser.me/api/"
    
    case GetUser(Int)
    
    var method: Alamofire.Method {
        switch self {
        case .GetUser:
            return .GET
        }
    }
    
    
    var parameters: [String: AnyObject] {
        return ["results": 200]
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: RandomUserRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .GetUser:
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        }
    }
}
