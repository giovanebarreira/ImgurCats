//
//  CatDetailsViewController.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 08/02/23.
//

import UIKit
import Kingfisher

final class CatDetailsViewController: UIViewController {

    private var viewModel: CatDetailsViewModelOutput

    // UI Components
    var catImage: AnimatedImageView = {
        let imageView = AnimatedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        return imageView
    }()

    var catName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()


    init(viewModel: CatDetailsViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        view.addSubview(catImage)
        view.addSubview(catName)

        view.backgroundColor = .white
        retrieveCachedImage(viewModel.selectedCat.image)
        catName.text = viewModel.selectedCat.name

        // shadow
        catImage.layer.shadowColor = UIColor.black.cgColor
        catImage.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        catImage.layer.shadowRadius = 3.0
        catImage.layer.shadowOpacity = 0.5
        catImage.layer.masksToBounds = false
        catName.clipsToBounds = true

        // image constraints
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            catImage.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: catImage.trailingAnchor, multiplier: 1),
            catImage.heightAnchor.constraint(equalToConstant: 500)
        ])

        // label constraints
        NSLayoutConstraint.activate([
            catName.centerXAnchor.constraint(equalTo: catImage.centerXAnchor),
            catName.topAnchor.constraint(equalToSystemSpacingBelow: catImage.bottomAnchor, multiplier: 1)
        ])
    }

    private func retrieveCachedImage(_ imageURL: URL) {
        let cache = ImageCache.default
        let urlString = String(describing: imageURL)

        cache.retrieveImage(forKey: urlString) { [weak self] result in
            switch result {
            case .success(let value):
                self?.catImage.kf.indicatorType = .activity
                self?.catImage.image = value.image

            case .failure(let error):
                self?.showAlert(errorMessage: error.localizedDescription, callback: {})
            }

        }
    }
}
