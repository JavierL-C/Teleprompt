//
//  NavigationCoordinator.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 3/10/23.
//

import Foundation
import UIKit

protocol NavigationCoordinator {
    var navigationController: UINavigationController { get set }
    func navigateToViewController(_ viewController: UIViewController)
    func presentViewController(_ viewController: UIViewController)
    func dismissViewController()
    func popMeToRootViewController()
}

extension NavigationCoordinator {
    func navigateToViewController(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentViewController(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
    
    func dismissViewController() {}
    
    func popMeToRootViewController() {
        navigationController.popViewController(animated: true)
    }
}
