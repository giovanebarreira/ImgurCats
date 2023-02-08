//
//  CatsListCoordinatorTests.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import XCTest
import UIKit
@testable import ImgurCats

final class CatsListCoordinatorTests: XCTestCase {

    var sut: CatsListCoordinator!
    var navigationController: UINavigationController!

    override func setUp() {
      super.setUp()
      navigationController = UINavigationController()
      sut = CatsListCoordinator(navigationController: navigationController)
    }

    override func tearDown() {
      navigationController = nil
      sut = nil
      super.tearDown()
    }

    func test_if_startOpens_catsListScreen() {
      sut.start()

      XCTAssert(navigationController.viewControllers.first is CatsListViewController)
    }

    func test_if_goToCatDetails_opensTheRightScreen() {
        sut.goToCatDetails(selectedCat: SelectedCatDummy.cat)

      XCTAssert(navigationController.viewControllers.first is CatDetailsViewController)
    }
  }
