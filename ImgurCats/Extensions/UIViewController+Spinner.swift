//
//  UIViewController+Spinner.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 07/02/23.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView!.backgroundColor = .clear

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView!.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }

    func removeSpinner() {
        if aView != nil {
            aView?.removeFromSuperview()
            aView = nil
        }
    }

  func spinnerFooter() -> UIView {
      let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
      let spinner = UIActivityIndicatorView()
      spinner.center = footerView.center
      footerView.addSubview(spinner)
      spinner.startAnimating()
      return footerView
  }
}
