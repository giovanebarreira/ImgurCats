//
//  SceneDelegate.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = CatsListViewController()
        let navigation = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigation

        self.window = window
        window.makeKeyAndVisible()
    }
}

