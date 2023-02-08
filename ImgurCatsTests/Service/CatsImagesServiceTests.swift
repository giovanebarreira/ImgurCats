//
//  CatsImagesServiceTests.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import XCTest
@testable import ImgurCats

final class CatsImagesServiceTests: XCTestCase {

    var sut: CatsImagesServices!
    var network: NetworkServiceMock!

    override func setUp() {
        super.setUp()
        network = NetworkServiceMock()
        sut = CatsImagesServices(service: network)
    }

    override func tearDown() {
        network = nil
        sut = nil
        super.tearDown()
    }

    func test_fetchCatsImages_returnSuccess() {
        let expectation = expectation(description: "feching list")

        sut.fetchCatsImages(page: 0) { result in
            switch result {
            case .success(let catsList):
                XCTAssertEqual(catsList.data[1], CatsListDummy.list)
            case .failure:
                XCTFail("Should return success")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func test_fetchCatsImages_returnFailure() {
        let expectation = expectation(description: "feching list")
        network.isFetchingError = true

        sut.fetchCatsImages(page: 0) { result in
            switch result {
            case .success:
                XCTFail("Should return failure")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.badResponse)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
