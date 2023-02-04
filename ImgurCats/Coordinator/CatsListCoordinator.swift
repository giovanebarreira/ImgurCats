//
//  CatsListCoordinator.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit


final class CatsListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let service = NetworkService()
        let catsImageService = CatsImagesServices(service: service)
        let viewModel = CatsListViewModel(service: catsImageService)
        let viewController = CatsListViewController()

        navigationController.pushViewController(viewController, animated: true)
    }
}
