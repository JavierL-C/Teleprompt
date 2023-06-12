//
//  ViewController.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 07/06/2023.
//

import UIKit

class MainViewController: UIViewController {
  
    
    // IBOutlets
    
    weak var coordinator: Coordinator?
    
    //ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    func navigateToOtherViewController(vc:UIViewController) {
        coordinator?.navigateToViewController(vc)
    }
}

