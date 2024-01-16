//
//  ImageLoader.swift
//  TestProject
//
//  Created by Sergo on 16.01.2024.
//

import UIKit

class ImageLoader {
    static let shared = ImageLoader()

    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
