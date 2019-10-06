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
    @IBOutlet weak var collectionview:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: CarViewModel.collectionViewCell().nibName(), bundle: nil), forCellWithReuseIdentifier:CarViewModel.collectionViewCell().cellIdentifier())
    }
    
    class func identifier() -> String {
        return "ListViewController"
    }
    
    func reloadData() {
        carsList = self.delegate?.getCars() ?? []
    }

}

extension ListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsList.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let model = carsList[indexPath.row]
        let viewModel = CarViewModel(model: model)
        let reuseIdentifier = CarViewModel.collectionViewCell().cellIdentifier()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PresentableCell
        cell.setup(viewModel: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width / 2) - 10
        let height = width
        return CGSize(width: width, height: height)
    }
}
