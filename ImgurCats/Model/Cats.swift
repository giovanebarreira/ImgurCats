//
//  Cats.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

import Foundation

// MARK: - Welcome
struct Cats: Codable {
    let data: [CatImages]
}

// MARK: - Datum
struct CatImages: Codable {
    let images: [Image]

    enum CodingKeys: String, CodingKey {
        case images
    }
}


// MARK: - Image
struct Image: Codable {
    let id: String
    let title: String?
    let type: TypeEnum
    let width, height, size: Int
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, title, type, width, height, size, link
    }
}

enum TypeEnum: String, Codable {
    case imageGIF = "image/gif"
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case videoMp4 = "video/mp4"
}
