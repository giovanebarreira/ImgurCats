//
//  CatsListCoordinator.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

protocol CatsListCoordinated: AnyObject {
    func goToCatDetails(selectedCat: CatsListDisplay)
}

final class CatsListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let service = NetworkService()
        let catsImageService = CatsImagesServices(service: service)
        let viewModel = CatsListViewModel(service: catsImageService)
        let viewController = CatsListViewController(viewModel: viewModel)
        viewController.coordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension CatsListCoordinator: CatsListCoordinated {
    func goToCatDetails(selectedCat: CatsListDisplay) {
        let catDetailsCoordinator = CatDetailsCoordinator(navigationController: navigationController, selectedCat: selectedCat)
        catDetailsCoordinator.start()
    }
}
