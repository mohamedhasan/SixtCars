//
//  BaseViewController.swift
//  SixtCars
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func presentError(error:NetworkError) {
        
        let title = NSLocalizedString("Error", comment: "")
        let message = error.localizedDescription
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = NSLocalizedString("cancel", comment: "")
        alert.addAction(UIAlertAction(title: cancel, style: .cancel, handler: nil))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
