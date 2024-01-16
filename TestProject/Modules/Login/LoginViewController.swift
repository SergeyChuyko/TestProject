//
//  LoginViewController.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import UIKit

class LoginViewController: UIViewController {
    private var viewModel: LoginViewModel!
    private var loginView: LoginView!

    override func loadView() {
        super.loadView()
        let model = LoginModel()
        viewModel = LoginViewModel(model: model)
        loginView = LoginView()
        self.view = loginView
        setupActions()

        loginView.usernameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        guard let login = loginView.usernameTextField.text,
              let password = loginView.passwordTextField.text,
              viewModel.validateLoginAndPassword(login: login, password: password) else {
            return
        }

        viewModel.loginUser(withLogin: login, password: password) { [weak self] success in
            if success {
                print("Вход выполнен успешно")
                let checklistVC = ChecklistViewController()
                checklistVC.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self?.present(checklistVC, animated: true, completion: nil)
                }
            } else {
                print("Ошибка")
            }
        }
    }

    @objc private func textFieldChanged() {
        loginView.update(with: viewModel)
    }
}
