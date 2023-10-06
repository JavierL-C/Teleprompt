//
//  AuthCoordinator.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 3/10/23.
//

import Foundation
import UIKit

enum LoginCoordinatorResult {
    case success
    case failure(error: Error)
}

class AuthCoordinator: Coordinator, NavigationCoordinator {
    
    var navigationController: UINavigationController
    private let factory: MainViewControllerFactory
    
    init(navigationController: UINavigationController, factory: MainViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let loginView = factory.makeLoginViewController()
        navigateToViewController(loginView)
    }
}
