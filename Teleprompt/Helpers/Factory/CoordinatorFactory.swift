//
//  CoordinatorFactory.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 3/10/23.
//

import Foundation
import UIKit

protocol LoginCoordinatorFactory {
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator
}

class CoordinatorFactory: LoginCoordinatorFactory {
    private let viewControllerFactory: MainViewControllerFactory
    
    init(viewControllerFactory: MainViewControllerFactory) {
        self.viewControllerFactory = viewControllerFactory
    }
    
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator {
        AuthCoordinator(navigationController: navigationController, factory: viewControllerFactory)
    }
}
