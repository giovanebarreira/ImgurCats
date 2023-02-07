//
//  CatsCollectionCell.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 06/02/23.
//

import UIKit
import Kingfisher

final class CatsCollectionCell: UICollectionViewCell {
    static let cellIdentifier = "CatsCollectionCell"
    private var cornerRadius: CGFloat = 5.0

    var thumbnail: AnimatedImageView = {
        let thumbnailImg = AnimatedImageView()
        thumbnailImg.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImg.contentMode = .scaleAspectFill
        thumbnailImg.clipsToBounds = true
        return thumbnailImg
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
        setupThumbnail()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail.image = nil
    }

    func configure(with image: URL) {
       // images.forEach { self.downloadImage($0) }
        self.downloadImage(image)

    }

    private func downloadImage(_ imageURL: URL) {
        let resource = ImageResource(downloadURL: imageURL, cacheKey: imageURL.absoluteString)
        thumbnail.kf.indicatorType = .activity
        thumbnail.kf.setImage(with: resource)
    }

    private func setupLayout() {
        contentView.backgroundColor = .gray

        // Corners
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.masksToBounds = false

        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }

    private func setupThumbnail() {
        contentView.addSubview(thumbnail)

        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            thumbnail.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: thumbnail.trailingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: thumbnail.bottomAnchor, multiplier: 0)
        ])
    }
}
