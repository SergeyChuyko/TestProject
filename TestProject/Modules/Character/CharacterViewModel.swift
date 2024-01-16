//
//  CharacterViewModel.swift
//  TestProject
//
//  Created by Sergo on 16.01.2024.
//

import UIKit

class CharacterViewModel {
    var characterName: String = ""
    var characterImage: UIImage?

    init(characterName: String = "", characterImage: UIImage? = nil) {
        self.characterName = characterName
        self.characterImage = characterImage
    }
}
