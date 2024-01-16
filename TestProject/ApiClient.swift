//
//  ApiClient.swift
//  TestProject
//
//  Created by Sergo on 15.01.2024.
//
import UIKit

class RickAndMortyAPI {
    static let shared = RickAndMortyAPI()
    private let url = "https://rickandmortyapi.com/api/character"

    func fetchCharacterData(completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: url) else {
            print("Неверный  URL")
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            do {
                let characterData = try JSONDecoder().decode(CharacterData.self, from: data)
                let characters = characterData.results
                completion(characters)
            } catch {
                completion([])
            }
        }.resume()
    }
}
