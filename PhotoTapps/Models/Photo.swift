//
//  Photo.swift
//  PhotoTapps
//
//  Created by Matvei Khlestov on 17.09.2023.
//

import UIKit

struct Photo {
    let name: UIImage?
    
    static func getPhotos() -> [Photo] {
        [
            Photo(name: UIImage(named: "dog1")),
            Photo(name: UIImage(named: "dog2")),
            Photo(name: UIImage(named: "dog3")),
            Photo(name: UIImage(named: "dog4")),
            Photo(name: UIImage(named: "dog5")),
            Photo(name: UIImage(named: "dog6")),
            Photo(name: UIImage(named: "dog7")),
            Photo(name: UIImage(named: "dog8")),
            Photo(name: UIImage(named: "dog9")),
            Photo(name: UIImage(named: "dog10")),
            Photo(name: UIImage(named: "dog11")),
            Photo(name: UIImage(named: "dog12")),
            Photo(name: UIImage(named: "dog13")),
            Photo(name: UIImage(named: "dog14")),
            Photo(name: UIImage(named: "dog15"))
        ]
    }
}
