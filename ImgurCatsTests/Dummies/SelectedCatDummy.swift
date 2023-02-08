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
        image: URL(string: "https://imgur.com/a/59uAEIA")!,
        name: "Fluffy"
    )
}
