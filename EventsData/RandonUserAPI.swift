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
    
    case GetUser
    
    var method: Alamofire.Method {
        switch self {
        case .GetUser:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .GetUser:
            return ""
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let URL = NSURL(string: RandomUserRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .GetUser:
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        }
    }
}
