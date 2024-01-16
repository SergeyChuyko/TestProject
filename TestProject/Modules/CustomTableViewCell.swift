//
//  CustomTableViewCell.swift
//  TestProject
//
//  Created by Sergo on 16.01.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()

    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    weak var delegate: CharacterDetailsDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func loadImage(from url: URL) {
        ImageLoader.shared.loadImage(from: url) { [weak self] image in
            DispatchQueue.main.async {
                self?.customImageView.image = image
            }
        }
    }

    func showCharacterDetails() {
        guard let characterName = titleLabel.text else {
            return
        }
        delegate?.showCharacterDetails(characterName: characterName, characterImage: customImageView.image)
    }

    private func commonInit() {
        addSubview(titleLabel)
        addSubview(customImageView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: customImageView.leadingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            customImageView.widthAnchor.constraint(equalToConstant: 80),
            customImageView.heightAnchor.constraint(equalToConstant: 80),
            customImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            customImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
