//
//  MapViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit
import SPStorkController
import MapKit

protocol CarsDataSourceProtocol:NSObject {
    func getCars() -> [CarModel]
}

class MapViewController: BaseViewController {

    @IBOutlet public weak var mapView: MKMapView!
    var listVC:ListViewController?
    var carsList = [CarModel]()
    
    private func listViewController() -> ListViewController {
        
        if listVC == nil {
            listVC = storyboard?.instantiateViewController(withIdentifier: ListViewController.identifier()) as? ListViewController
            listVC?.delegate = self
        }
        
        return listVC!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        loadCars()
    }
    
    @objc private func loadCars() {
        
        mapView.removeAnnotations(mapView.annotations)
        SixtApi.getCars(completion: { (response) in
            if let cars = response as? [CarModel] {
                self.carsList = cars
                //load Data on Map:
                self.addAnnotations()
                //Load Data on List
                self.listViewController().reloadData()
            }
        }) { (error) in
            self.presentError(error: error)
            self.listViewController().presentError(error: error)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupNavBar() {
        
        let rightBarItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action: #selector(loadCars))
        rightBarItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarItem
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "grid"), style: .plain, target: self, action: #selector(showList))
        leftBarItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    @objc private func showList() {
        let listView = listViewController()
        self.presentAsStork(listView)
    }
}

extension MapViewController: CarsDataSourceProtocol {
    func getCars() -> [CarModel] {
        return carsList
    }
}

extension MapViewController: MKMapViewDelegate {
    
    private func addAnnotations() {
        
        var annotations = [MKAnnotation]()
        for car in carsList {
            let annotation = CarViewModel(model: car)
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
    }
    
    public func mapView(_ mapView: MKMapView,
                        viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let viewModel = annotation as? CarViewModel else {
            return nil
        }
        
        let identifier = viewModel.pinIdentifier()
        let annotationView: MKAnnotationView
        if let existingView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            annotationView = existingView
        } else {
            annotationView = MKAnnotationView(annotation: viewModel,
                                              reuseIdentifier: identifier)
        }
        annotationView.image = viewModel.mapPin()
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: CarDetailsViewController.identifier()) as! CarDetailsViewController
        if let viewModel = view.annotation as? CarViewModel {
            
            let transitionDelegate = SPStorkTransitioningDelegate()
            detailsVC.transitioningDelegate = transitionDelegate
            detailsVC.modalPresentationStyle = .custom
            transitionDelegate.customHeight = 350
            self.present(detailsVC, animated: true, completion: nil)
            detailsVC.setup(viewModel: viewModel)
        }
        
    }
    
}
