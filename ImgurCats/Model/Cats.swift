//
//  Cats.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

struct Cats: Codable, Equatable {
    static func == (lhs: Cats, rhs: Cats) -> Bool {
        lhs.data == rhs.data
    }

    let data: [CatImages]
}

struct CatImages: Codable, Equatable {
    static func == (lhs: CatImages, rhs: CatImages) -> Bool {
        lhs.images == rhs.images ||
        lhs.tags == rhs.tags
    }

    let images: [Image]?
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case images, tags
    }
}

struct Image: Codable, Equatable {
    let link: String

    enum CodingKeys: String, CodingKey {
        case link
    }
}

struct Tag: Codable, Equatable {
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
}
