//
//  LoginView.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import UIKit

class LoginView: UIView {

    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Логин"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Пароль"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        loginButton.isEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .lightGray

        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)
    }


    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            usernameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }


    @objc private func dismissKeyboard() {
        endEditing(true)
    }

    func update(with viewModel: LoginViewModel) {
        let isUsernameFilled = !(usernameTextField.text?.isEmpty ?? true)
        let isPasswordFilled = !(passwordTextField.text?.isEmpty ?? true)

        if isUsernameFilled && isPasswordFilled {
            loginButton.backgroundColor = .systemGreen
            loginButton.isEnabled = true
        } else {
            loginButton.backgroundColor = .systemRed
            loginButton.isEnabled = false
        }
    }
}
