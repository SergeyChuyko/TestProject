//
//  ChecklistViewController.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import UIKit

protocol CharacterDetailsDelegate: AnyObject {
    func showCharacterDetails(characterName: String, characterImage: UIImage?)
}

class ChecklistViewController: UIViewController {
    var viewModel = ChecklistViewModel()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()

        viewModel.requset()
        reloadTableView()
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

    }

    private func reloadTableView() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(cancelButton)
        setupTableView()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -8),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ChecklistViewController: CharacterDetailsDelegate {
    func showCharacterDetails(characterName: String, characterImage: UIImage?) {
        let characterVC = CharacterViewController()
        characterVC.viewModel.characterName = characterName
        characterVC.viewModel.characterImage = characterImage
        
        present(characterVC, animated: true, completion: nil)
    }
}

