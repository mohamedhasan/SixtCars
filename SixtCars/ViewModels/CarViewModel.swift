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

    private let model:CarModel
    
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
    
    func mapPin() -> UIImage {
        return UIImage(named: "pin")!
    }
    
    func pinIdentifier() -> String {
        return "pinIdentifier"
    }
    
    func photoUrl() -> URL? {
        if let url = model.carImageUrl {
            return URL(string: url)
        }
        return nil
    }
    
    func licensePlate() -> String {
        return model.licensePlate
    }
}

extension CarViewModel {
    class func collectionViewCell() -> PresentableCell.Type {
        return CarCollectionViewCell.self
    }
}

extension CarViewModel: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(model.latitude, model.latitude)
    }
    public var title: String? {
        return model.make
    }
    public var subtitle: String? {
        return model.modelName
    }
}
