//
//  LoginViewModel.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import UIKit

class LoginViewModel {

    private var model: LoginModel

    init(model: LoginModel) {
        self.model = model
    }

    func validateLoginAndPassword(login: String, password: String) -> Bool {
        let isLoginValid = model.validateLogin(login)
        let isPasswordValid = model.validatePassword(password)
        return isLoginValid && isPasswordValid
    }

    func loginUser(withLogin login: String, password: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}

