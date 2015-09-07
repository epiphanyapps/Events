//
//  Five100px.swift
//  Photomania
//
//  Created by Essan Parto on 2014-09-25.
//  Copyright (c) 2014 Essan Parto. All rights reserved.
//

import UIKit
import Alamofire

/**

ParseRouter is a enum type that adopts the URLRequestConvertible protocol. This enum will manage the network calls to the Parse.com backend

- GetSession(String?): This method fetches a session object whose objectId is equal to the provided String. If nil it will return a Array of random session objects.
- CreateUser([String: AnyObject]): For the new user sitation. One textfield for email or username, one textfield for password, and one textfield for password confimation.
- ReadUser(String): For login where the user is provided a unique pin or password. One textfield for the pin.
- UpdateUser(String, [String: AnyObject])
- DestroyUser(String)

*/

enum ParseRouter: URLRequestConvertible {
    static let appID = "u6Rlod4Kp8GiC4kxsU9csu3rLCYlcazuM9JhiKEj"
    static let myJavaScriptKey = "BcMkLH28sCJyM3eNzNrd4usAwiT5XvbgopmQvgtm"
    static let RESTAPIKey = "myLgKR5MKajNZKeRc2BNODpoJdYh7mpIhscnEAGL"
    static let baseURLString = "https://api.parse.com/1/"
    static var OAuthToken: String?
    
    case GetSession(String?)
    case CreateSession([String: AnyObject])
    case UpdateSession(String, [String: AnyObject])
    case DestroySession(String)
    
    var method: Alamofire.Method {
        switch self {
        case .GetSession:
            return .GET
        case .CreateSession:
            return .POST
        case .UpdateSession:
            return .PUT
        case .DestroySession:
            return .DELETE
        }
    }
    
    var path: String {
        let prefix = "classes/Session/"
        switch self {
        case .GetSession(let sessionID):
            if let localID = sessionID {
                return prefix + localID
            } else {
                return prefix
            }
        case .CreateSession(_):
            return prefix;
        case .UpdateSession(let objectId, _):
            return prefix + objectId;
        case .DestroySession(let objectId):
            return prefix + objectId
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        
        let URL = NSURL(string: ParseRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.setValue(ParseRouter.appID, forHTTPHeaderField: "X-Parse-Application-Id")
        mutableURLRequest.setValue(ParseRouter.RESTAPIKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        //        if let token = Router.OAuthToken {
        //            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        //        }
        
        switch self {
        case .GetSession( _):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
        case .CreateSession(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateSession(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .DestroySession(_):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: nil).0
        }
    }
}
