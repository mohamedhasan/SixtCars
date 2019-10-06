//
//  SixtApi.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import Foundation

class SixtApi: NSObject {

    class func getCars(completion: @escaping (AnyObject?) -> Void,errorHandler:@escaping (NetworkError) -> Void) {
        
        let request = SixtRequest(paramters: nil)
        NetworkManager.sharedInstance.perfromRequest(request: request, of: [CarModel].self, completion: completion, errorHandler: errorHandler)
    }
}
