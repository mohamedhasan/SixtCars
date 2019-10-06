//
//  PresentableCell.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

protocol PresentableCell:UICollectionViewCell {
    static func cellIdentifier() -> String
    static func nibName() -> String
    func setup(viewModel:CarViewModel)
}
