//
//  CatDetailsCoordinatorTests.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import XCTest
import UIKit
@testable import ImgurCats

final class CatDetailsCoordinatorTests: XCTestCase {

  var sut: CatDetailsCoordinator!
  var navigationController: UINavigationController!

  override func setUp() {
    super.setUp()
    navigationController = UINavigationController()
      sut = CatDetailsCoordinator(navigationController: navigationController, selectedCat: SelectedCatDummy.cat)
  }

  override func tearDown() {
    navigationController = nil
    sut = nil
    super.tearDown()
  }

  func test_if_startOpens_catDetailsScreen() {
    sut.start()

    XCTAssert(navigationController.viewControllers.first is CatDetailsViewController)
  }
}
