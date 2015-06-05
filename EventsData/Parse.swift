//
//  Five100px.swift
//  Photomania
//
//  Created by Essan Parto on 2014-09-25.
//  Copyright (c) 2014 Essan Parto. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    static let appID = "u6Rlod4Kp8GiC4kxsU9csu3rLCYlcazuM9JhiKEj"
    static let myJavaScriptKey = "BcMkLH28sCJyM3eNzNrd4usAwiT5XvbgopmQvgtm"
    static let RESTAPIKey = "myLgKR5MKajNZKeRc2BNODpoJdYh7mpIhscnEAGL"
    static let baseURLString = "https://api.parse.com/1/"
    static var OAuthToken: String?
    
    case GetSession(String)
    case CreateUser([String: AnyObject])
    case ReadUser(String)
    case UpdateUser(String, [String: AnyObject])
    case DestroyUser(String)
    
    var method: Alamofire.Method {
        switch self {
        case .GetSession:
            return .GET
        case .CreateUser:
            return .POST
        case .ReadUser:
            return .GET
        case .UpdateUser:
            return .PUT
        case .DestroyUser:
            return .DELETE
        }
    }
    
    var path: String {
        switch self {
        case .GetSession:
            return "/classes/Session"
        case .CreateUser:
            return "/users"
        case .ReadUser(let username):
            return "/users/\(username)"
        case .UpdateUser(let username, _):
            return "/users/\(username)"
        case .DestroyUser(let username):
            return "/users/\(username)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.setValue(Router.appID, forHTTPHeaderField: "X-Parse-Application-Id")
        mutableURLRequest.setValue(Router.RESTAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
//        if let token = Router.OAuthToken {
//            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
        
        switch self {
        case .GetSession(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        case .CreateUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateUser(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}
