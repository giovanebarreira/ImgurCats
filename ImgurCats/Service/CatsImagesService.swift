//
//  CatsListService.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

protocol CatsImagesNetworking {
    typealias CatsImages = ((Result<Cats, NetworkError>) -> Void)
    func fetchCatsImages(page: Int, completion: @escaping CatsImages)
}

struct CatsImagesServices: CatsImagesNetworking {
    private let service: Networking

    init(service: Networking) {
        self.service = service
    }

    func fetchCatsImages(page: Int, completion: @escaping CatsImages) {
        let endpoint = Endpoint()
        let url = endpoint.catImagesEndpoint(page: page)
        let headers = [
            "authorization" : endpoint.apiKey
        ]

        service.fetchService(url: url, headers: headers, method: .get, completion: completion)
    }
}
