//
//  ViewController.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

final class CatsListViewController: UIViewController {

    private var viewModel: CatsListViewModelOutput
    private var collectionView: UICollectionView?
    private var isFetchingData: Bool = false
    private var currentPage: Int = 0

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
        self.setupCollectionView()
        viewModel.delegate = self
        viewModel.fetchList(page: currentPage)
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
        if isFetchingData {
            isFetchingData = false
        }

        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }

    func showSpinner(_ isLoading: Bool) {
        DispatchQueue.main.async {
            if !self.isFetchingData {
                isLoading ? self.showSpinner() : self.removeSpinner()
            }
        }
    }

    func didFail(error: String) {
        DispatchQueue.main.async {
            self.showAlert(errorMessage: error, callback: self.alertCallback)
        }
    }

    private func alertCallback() {
        self.viewModel.fetchList(page: self.currentPage)
    }
}

extension CatsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.catsListDisplay.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsCollectionCell.cellIdentifier, for: indexPath) as? CatsCollectionCell else { return UICollectionViewCell() }

        let catObject = viewModel.catsListDisplay[indexPath.row]
        cell.configure(with: catObject)

        return cell
    }
}

extension CatsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.catsListDisplay[indexPath.item])
    }
}

extension CatsListViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let seventyPercenteOfContentHeight = contentHeight * 0.7

        if offsetY > seventyPercenteOfContentHeight {
            if !isFetchingData {
                beginBatchFetch()
            }
        }
    }

    func beginBatchFetch() {
        currentPage += 1
        isFetchingData = true
        viewModel.fetchList(page: currentPage)
    }
}
