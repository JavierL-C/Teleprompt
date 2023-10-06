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
}

class MainCoordinator: Coordinator {
    
    private let navigationController:UINavigationController
    private let coordinatorFactory: CoordinatorFactory
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.coordinatorFactory = CoordinatorFactory(viewControllerFactory: MainViewControllerFactory())
    }
    
    func start() {
        starLoginCoordinator()
    }
    
    func dismissViewController() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    private func starLoginCoordinator() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
