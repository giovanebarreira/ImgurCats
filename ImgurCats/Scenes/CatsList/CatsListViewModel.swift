//
//  CatsListViewModel.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

protocol CatsListViewModelOutput {
    var catsList: [CatImages] { get }
    var delegate: CatsListDelegate? { get set }
    func fetchList(page: Int)
}

protocol CatsListDelegate: AnyObject {
    func displayCatsList()
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
}

final class CatsListViewModel: CatsListViewModelOutput {
    var catsList: [CatImages] = []
    weak var delegate: CatsListDelegate?
    private let service: CatsImagesNetworking

    init(service: CatsImagesNetworking) {
        self.service = service
    }

    func fetchList(page: Int) {
        DispatchQueue.global(qos: .background).async {
            self.fetchCatsImages(page: page) { [weak self] catsResult in
                guard let catsResult = catsResult else { return }
                self?.catsList.append(contentsOf: catsResult.data)
                self?.delegate?.displayCatsList()
            }
        }
    }

    func fetchCatsImages(page: Int, completion: @escaping (Cats?) -> Void) {
        delegate?.showSpinner(true)
        service.fetchCatsImages(page: page) { [weak self] result in
            switch result {
            case .success(let cats):
                completion(cats)
            case .failure(let error):
                self?.delegate?.didFail(error: error.localizedDescription)
                completion(nil)
            }
            self?.delegate?.showSpinner(false)
        }
    }
}
