//
//  ViewController.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

final class CatsListViewController: UIViewController {

    private var viewModel: CatsListViewModelOutput
    var collectionView: UICollectionView?

    init(viewModel: CatsListViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Cats List"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        viewModel.delegate = self
        viewModel.fetchList(page: 1)
        setupCollectionView()
    }

    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 8, bottom: 0, right: 8)
        flowLayout.itemSize = CGSize(width: 115, height: 110)

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView?.register(CatsCollectionCell.self, forCellWithReuseIdentifier: CatsCollectionCell.cellIdentifier)

        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.backgroundColor = .white

        view.addSubview(collectionView ?? UICollectionView())
    }
}

extension CatsListViewController: CatsListDelegate {
    func displayCatsList() {
        print(viewModel.catsList)
    }

    func showSpinner(_ isLoading: Bool) {

    }

    func didFail(error: String) {

    }
}

extension CatsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsCollectionCell.cellIdentifier, for: indexPath)

        return cell
    }
}

extension CatsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected cell at \(indexPath)")
    }
}
