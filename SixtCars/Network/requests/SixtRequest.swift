//
//  SixtRequest.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

class SixtRequest: NSObject,RequestProtocol {
    
    var url: String
    var method: HttpRequestMethod
    var headers: [String : String]?
    var paramters: [String : Any]?
    static let SIXT_URL = "https://cdn.sixt.io/codingtask/cars"
    
    init(paramters:[String:Any]?) {
        self.url = SixtRequest.SIXT_URL
        self.headers = ["Content-Type" : "application/json"]
        self.method = .get
        self.paramters = paramters
    }
    
    
}
