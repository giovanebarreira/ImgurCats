//
//  CatsList+Dummy.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import UIKit
@testable import ImgurCats

enum CatsListDummy {
    static let list = CatImages(
        images: [
            Image(link: "https://i.imgur.com/VMGUn2k.jpg"),
            Image(link: "https://i.imgur.com/D63kaiG.gif"),
            Image(link: "https://i.imgur.com/SUGw7d4.gif")
        ],
        tags: [Tag(displayName: "emergency_cats")]
    )
}
