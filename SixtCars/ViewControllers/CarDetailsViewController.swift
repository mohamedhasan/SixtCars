//
//  CarDetailsViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

class CarDetailsViewController: BaseViewController {

    @IBOutlet weak var carImage:UIImageView!
    @IBOutlet weak var modelLabel:UILabel!
    @IBOutlet weak var transimittionImage:UIImageView!
    @IBOutlet weak var carPlatesNumbers:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func identifier() -> String {
        return "CarDetailsViewController"
    }
    
    func setup(viewModel:CarViewModel) {
        transimittionImage.image = viewModel.transmissionImage()
        modelLabel.text = viewModel.modelText()
        carPlatesNumbers.text = viewModel.licensePlate()
        
        if let url = viewModel.photoUrl() {
            carImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            carImage.image = UIImage(named: "placeholder")
        }
    }

}
