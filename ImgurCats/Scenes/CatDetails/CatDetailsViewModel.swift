//
//  CatDetailsViewModel.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 08/02/23.
//

import Foundation

protocol CatDetailsViewModelOutput {
    var selectedCat: CatsListDisplay { get }
}

final class CatDetailsViewModel: CatDetailsViewModelOutput {
    var selectedCat: CatsListDisplay

    init(selectedCat: CatsListDisplay) {
        self.selectedCat = selectedCat
    }
}
