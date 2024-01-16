//
//  CharacterViewController.swift
//  TestProject
//
//  Created by Sergo on 16.01.2024.
//

import UIKit

class CharacterViewController: UIViewController {

    var viewModel: CharacterViewModel = CharacterViewModel()

    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    let characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(characterImageView)
        view.addSubview(characterNameLabel)

        updateUIWithViewModel()
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 350),
            characterImageView.heightAnchor.constraint(equalToConstant: 350),

            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 40),
            characterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            characterNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    private func updateUIWithViewModel() {
        characterNameLabel.text = viewModel.characterName
        characterImageView.image = viewModel.characterImage
    }
}
