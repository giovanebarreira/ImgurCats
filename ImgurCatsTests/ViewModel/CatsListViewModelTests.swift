//
//  CatsListViewModelTests.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import XCTest
@testable import ImgurCats

final class CatsListViewModelTests: XCTestCase {

    var sut: CatsListViewModel!
    var catsImagesService: CatsImagesServicesMock!

    override func setUp() {
        super.setUp()
        catsImagesService = CatsImagesServicesMock()
        sut = CatsListViewModel(service: catsImagesService)
    }

    override func tearDown() {
        sut = nil
        catsImagesService = nil
        super.tearDown()
    }

    func test_fetchCatsImages_returnSuccess() {
        sut.fetchCatsImages(page: 0) { cats in
            XCTAssertNotEqual(cats!.data.count, 0)
            XCTAssertEqual(cats!.data[1], CatsListDummy.list)
        }
    }

    func test_fetchCatsImages_returnFailure() {
        catsImagesService.isFetchingError = true

        sut.fetchCatsImages(page: 0) { cats in
            XCTAssertEqual(cats, nil)
        }
    }
}
