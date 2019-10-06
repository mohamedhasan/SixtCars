//
//  MapViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SixtApi.getCars(completion: { (response) in
            
            let cars = response as? [CarModel]
            
            
        }) { (error) in
            
        }
    }


}

