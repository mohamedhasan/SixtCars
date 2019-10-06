//
//  CarCollectionViewCell.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import SDWebImage

class CarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImage:UIImageView!
    @IBOutlet weak var modelLabel:UILabel!
    @IBOutlet weak var transimittionImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(viewModel:CarViewModel) {
        transimittionImage.image = viewModel.transmissionImage()
        modelLabel.text = viewModel.modelText()
        
        if let url = viewModel.photoUrl() {
            carImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        } else {
            carImage.image = UIImage(named: "placeholder")
        }
    }
}

extension CarCollectionViewCell:PresentableCell {
    
    static func cellIdentifier() -> String {
        return "CarCollectionViewCell"
    }
    
    static func nibName() -> String {
        return "CarCollectionViewCell"
    }
}
