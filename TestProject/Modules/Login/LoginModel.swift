//
//  LoginModel.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import Foundation

struct LoginModel {
    func validateLogin(_ login: String) -> Bool {
        login.contains { $0.isUppercase }
    }

    func validatePassword(_ password: String) -> Bool {
        password.count >= 2
    }
}
