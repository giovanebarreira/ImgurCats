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
        setupNavigationLayout()
    }

    func start() {
        let catsListCoordinator = CatsListCoordinator(navigationController: navigationController)
        catsListCoordinator.start()
    }

    private func setupNavigationLayout() {
        navigationController.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
}
