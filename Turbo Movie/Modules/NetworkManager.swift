//
//  NetworkManager.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit
import Alamofire

protocol NetworkManagerDelegate {
    func didSuccessRequest(responseObject: Dictionary<String, AnyObject>)
    func didFailedRequest(errorInfo: String)
}

class NetworkManager: NSObject {

    var delegate: NetworkManagerDelegate?
    let CODE_SUCESS = 200
    let CODE_CREATE_SUCESS = 201
    
    func request(parameters: [String: AnyObject]?, url: String, method: Int) {
        
        var requestMethod: HTTPMethod = .get
        
        if method == Constants.REQUEST_POST {
            requestMethod = .post
        }
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        AF.request(url, method: requestMethod, headers: headers).responseJSON { response in
            if let error = response.error {
                if let delegate = self.delegate {
                    delegate.didFailedRequest(errorInfo: error.localizedDescription)
                }
            }else{
                let responseDictionary = response.value as! Dictionary<String, AnyObject>
                if let delegate = self.delegate {
                    delegate.didSuccessRequest(responseObject: responseDictionary)
                }
            }
        }
        
    }
    
}
