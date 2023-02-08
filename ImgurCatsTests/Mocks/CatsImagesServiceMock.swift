//
//  CatsImagesServiceMock.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import Foundation
@testable import ImgurCats

final class CatsImagesServicesMock: CatsImagesNetworking {

    var isFetchingError = false

    func fetchCatsImages(page: Int, completion: @escaping CatsImages) {
        let path = Bundle.main.url(forResource: "catsList", withExtension: "json")!

        if isFetchingError {
          return completion(.failure(.serverError))
        }

        let data = try! Data(contentsOf: path, options: .mappedIfSafe)
        let results = try! JSONDecoder().decode(Cats.self, from: data)
        return completion(.success(results))
    }
}
