//
//  Cats.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

struct Cats: Codable {
    let data: [CatImages]
}

struct CatImages: Codable {
    let images: [Image]?
    let tags: [Tags]

    enum CodingKeys: String, CodingKey {
        case images, tags
    }
}

struct Image: Codable {
    let link: String

    enum CodingKeys: String, CodingKey {
        case link
    }
}

struct Tags: Codable {
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}
