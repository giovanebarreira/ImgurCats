//
//  UIViewController+Alert.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 07/02/23.
//

import UIKit

extension UIViewController {
  func showAlert(errorMessage: String, callback: @escaping() -> Void) {
    let alert = UIAlertController(title: "Error", message: "\(errorMessage)", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
      callback()
    }))

    alert.addAction(UIAlertAction(title: "Cancel", style: .default) { [weak self] _ in
      self?.dismiss(animated: true)
    })

    present(alert, animated: true)
  }
}
