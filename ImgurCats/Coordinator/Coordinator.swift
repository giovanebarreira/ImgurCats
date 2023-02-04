//
//  Coordinator.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
