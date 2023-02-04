//
//  AppCoordinator.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    let window: UIWindow

    var rootViewController: UIViewController { navigationController }

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }

    func start() {
        let catsListCoordinator = CatsListCoordinator(navigationController: navigationController)
        catsListCoordinator.start()
    }
}
