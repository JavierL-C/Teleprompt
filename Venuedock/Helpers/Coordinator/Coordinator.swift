//
//  Coordinator.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 07/06/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    func start()
    func navigateToViewController(_ viewController: UIViewController)
    func presentViewController(_ viewController: UIViewController)
    func dismissViewController()
}



class MainCoordinator:Coordinator {
    func start() {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func navigateToViewController(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)

    }
    
    func presentViewController(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true, completion: nil)

    }
    
    func dismissViewController() {
        navigationController.dismiss(animated: true, completion: nil)

    }
    
    
    private let navigationController:UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
