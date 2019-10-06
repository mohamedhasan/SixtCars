//
//  MapViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import SPStorkController

protocol CarsDataSourceProtocol:NSObject {
    func getCars() -> [CarModel]
}

class MapViewController: BaseViewController {

    var listVC:ListViewController?
    var carsList = [CarModel]()
    
    func listViewController() -> ListViewController {
        
        if listVC == nil {
            listVC = storyboard?.instantiateViewController(withIdentifier: ListViewController.identifier()) as? ListViewController
            listVC?.delegate = self
        }
        
        return listVC!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        SixtApi.getCars(completion: { (response) in
            
            if let cars = response as? [CarModel] {
                self.carsList = cars
                //load Data on Map:
                
                //Load Data on List
                self.listViewController().reloadData()
            }
            
        }) { (error) in
            self.presentError(error: error)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupNavBar() {
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        let barItem = UIBarButtonItem(image: UIImage(named: "grid"), style: .plain, target: self, action: #selector(showList))
        barItem.tintColor = .black
        navigationItem.leftBarButtonItem = barItem
    }
    
    @objc func showList() {
        let listView = listViewController()
        self.presentAsStork(listView)
    }
}

extension MapViewController: CarsDataSourceProtocol {
    func getCars() -> [CarModel] {
        return carsList
    }
}
