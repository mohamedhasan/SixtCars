//
//  CarViewModel.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import MapKit

class CarViewModel: NSObject {

    var model:CarModel
    
    public init(model:CarModel) {
        self.model = model
    }
    
    func modelText() -> String {
        return model.modelName + ", " + model.make
    }
    
    func transmissionImage() -> UIImage {
        if model.transmission == "M" {
            return UIImage(named: "manual")!
        } else {
            return UIImage(named: "automatic")!
        }
    }
    
    func photoUrl() -> URL? {
        if let url = model.carImageUrl {
            return URL(string: url)
        }
        return nil
    }
    
}

extension CarViewModel {
    
    class func collectionViewCell() -> PresentableCell.Type {
        return CarCollectionViewCell.self
    }
    
}
