//
//  ViewController.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import UIKit

final class CatsListViewController: UIViewController {

    private var viewModel: CatsListViewModelOutput

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
