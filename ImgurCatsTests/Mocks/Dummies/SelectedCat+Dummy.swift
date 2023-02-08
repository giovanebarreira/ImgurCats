//
//  SelectedCatDummy.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import UIKit
@testable import ImgurCats

enum SelectedCatDummy {
    static let cat = CatsListDisplay(
        image: URL(string: "https://i.imgur.com/ZKdnVo0.jpg")!,
        name: "catsofimgur"
    )
}
