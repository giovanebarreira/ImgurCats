//
//  CatDetailsCoordinator.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 08/02/23.
//

import UIKit

final class CatDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    let selectedCat: CatsListDisplay

    init(navigationController: UINavigationController, selectedCat: CatsListDisplay) {
        self.navigationController = navigationController
        self.selectedCat = selectedCat
        navigationController.navigationBar.prefersLargeTitles = false
    }

    func start() {
        let viewModel = CatDetailsViewModel(selectedCat: selectedCat)
        let viewController = CatDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
