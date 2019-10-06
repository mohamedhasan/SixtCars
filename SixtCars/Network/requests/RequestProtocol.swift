//
//  RequestProtocol.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import Foundation

enum HttpRequestMethod {
    case get
    case post
}

protocol RequestProtocol {
    var url : String { get set }
    var method : HttpRequestMethod { get set }
    var headers : [String:String]? { get set }
    var paramters : [String:Any]? { get set }
}
