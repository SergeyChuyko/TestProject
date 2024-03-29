//
//  ChecklistViewModel.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import Foundation

class ChecklistViewModel {

    var characterNames: [String] = []
    var imageUrls: [String] = []
    var reloadTableView: (() -> Void)?

    func requset() {
        RickAndMortyAPI.shared.fetchCharacterData { characters in
            for character in characters {
                self.characterNames.append(character.name)
                if URL(string: character.image) != nil {
                    self.imageUrls.append(character.image)
                } else {
                    print("Invalid image URL for \(character.name)")
                }
            }
            self.reloadTableView?()
        }
    }

    func numberOfSection() -> Int {
        1
    }

    func numberOfRows(_ section: Int) -> Int {
        characterNames.count
    }
}
