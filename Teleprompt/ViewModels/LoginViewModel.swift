//
//  LoginViewModel.swift
//  Teleprompt
//
//  Created by Javier Lumbi on 27/7/23.
//

import Foundation

protocol LoginViewModelProtocol {
    func authenticateUser(phoneNumber: Int)
}

final class LoginViewModel: LoginViewModelProtocol {
    func authenticateUser(phoneNumber: Int) {
        print("Something")
    }
}
