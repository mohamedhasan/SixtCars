//
//  ListViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController {

    weak var delegate:CarsDataSourceProtocol?
    var carsList = [CarModel]()
    let COLUMNS:CGFloat = 2.0
    let COLUMN_PADDING:CGFloat = 20.0
    @IBOutlet weak var collectionview:UICollectionView?
    @IBOutlet weak var noInternetConnetionLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview?.register(UINib(nibName: CarViewModel.collectionViewCell().nibName(), bundle: nil), forCellWithReuseIdentifier:CarViewModel.collectionViewCell().cellIdentifier())
    }
    
    class func identifier() -> String {
        return "ListViewController"
    }
    
    func reloadData() {
        carsList = self.delegate?.getCars() ?? []
        collectionview?.reloadData()
        noInternetConnetionLabel?.alpha = 0
    }

    override func presentError(error:NetworkError) {
        switch error {
        case .noInternetConnection:
            carsList = []
            self.collectionview?.reloadData()
            noInternetConnetionLabel?.alpha = 1
            break
        default:
            return
        }
    }
}

extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = carsList[indexPath.row]
        let viewModel = CarViewModel(model: model)
        let reuseIdentifier = CarViewModel.collectionViewCell().cellIdentifier()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PresentableCell
        cell.setup(viewModel: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width / COLUMNS) - (COLUMN_PADDING / 2)
        let height = width
        return CGSize(width: width, height: height)
    }
}
