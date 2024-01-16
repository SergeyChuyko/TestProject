//
//  ChecklistModel.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//

import Foundation

struct CharacterData: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let image: String
}
