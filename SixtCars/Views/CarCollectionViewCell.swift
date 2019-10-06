//
//  CarCollectionViewCell.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import SDWebImage

class CarCollectionViewCell: UICollectionViewCell,PresentableCell {

    @IBOutlet weak var carImage:UIImageView!
    @IBOutlet weak var modelLabel:UILabel!
    @IBOutlet weak var transimittionImage:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(viewModel:CarViewModel) {
        transimittionImage.image = viewModel.transmissionImage()
        modelLabel.text = viewModel.modelText()
        carImage.sd_setImage(with: viewModel.photoUrl(), placeholderImage: UIImage(named: "placeholder"))
    }
    
    static func cellIdentifier() -> String {
        return "CarCollectionViewCell"
    }
    
    static func nibName() -> String {
        return "CarCollectionViewCell"
    }
}
