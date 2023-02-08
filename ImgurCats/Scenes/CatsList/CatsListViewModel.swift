//
//  CatsListViewModel.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

protocol CatsListViewModelOutput {
    var catsListDisplay: [CatsListDisplay] { get }
    var delegate: CatsListDelegate? { get set }
    func fetchList(page: Int)
}

protocol CatsListDelegate: AnyObject {
    func displayCatsList()
    func showSpinner(_ isLoading: Bool)
    func didFail(error: String)
}

final class CatsListViewModel: CatsListViewModelOutput {
    var catsListDisplay: [CatsListDisplay] = []
    weak var delegate: CatsListDelegate?
    private let service: CatsImagesNetworking
    
    init(service: CatsImagesNetworking) {
        self.service = service
    }
    
    func fetchList(page: Int) {
        DispatchQueue.global(qos: .background).async {
            self.fetchCatsImages(page: page) { [weak self] catsResult in
                guard let catsResult = catsResult else { return }
                self?.populateCatsListDisplay(with: catsResult)
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

    private func populateCatsListDisplay(with cats: Cats?) {
        var catObjects: [CatObject] = []
        cats?.data.forEach { cat in
            let catObject = CatObject(cats: cat)
            catObjects.append(catObject)
        }

        catObjects.forEach { cat in
            cat.imagesUrl.forEach { image in
                catsListDisplay.append(CatsListDisplay(image: image, name: cat.name))
            }
        }
    }
}

struct CatObject {
    let cats: CatImages
    
    var imagesUrl: [URL] {
        var urlList: [URL] = []
        cats.images?.forEach { imageUrl in
            if let url = URL(string: imageUrl.link) {
                if url.pathExtension != "mp4" {
                    urlList.append(url)
                }
            }
        }
        return urlList
    }
    
    var name: String {
        return cats.tags.first?.displayName ?? ""
    }
}

struct CatsListDisplay {
    let image: URL
    let name: String
}
