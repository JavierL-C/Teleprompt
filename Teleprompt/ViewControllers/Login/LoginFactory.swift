//
//  LoginFactory.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 27/7/23.
//

import UIKit

protocol LoginFactoryProtocol {
    func makeLoginViewController() -> LoginViewController
}

final class LoginFactory: LoginFactoryProtocol {
    func makeLoginViewController() -> LoginViewController {
        let loginViewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: loginViewModel)
        return viewController
    }
}
