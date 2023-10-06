//
//  MainViewControllerFactory.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 3/10/23.
//

import Foundation
import UIKit

protocol LoginFactoryProtocol {
    func makeLoginViewController() -> LoginViewController
}

final class MainViewControllerFactory: LoginFactoryProtocol {
    
    func makeLoginViewController() -> LoginViewController {
        let loginViewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: loginViewModel)
        return viewController
    }
}
