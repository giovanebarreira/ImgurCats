//
//  NetworkServiceMock.swift
//  ImgurCatsTests
//
//  Created by Giovane Barreira on 08/02/23.
//

import Foundation
@testable import ImgurCats

enum PathType: String {
    case catsList
}

final class NetworkServiceMock: Networking {
    var isFetchingError = false
    var pathType: PathType = .catsList

    func fetchService<T>(url: String, headers: [String : String], method: ImgurCats.HttpMethod, completion: @escaping Fetch<T>) where T : Decodable {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(1)) {
            if self.isFetchingError {
                return completion(.failure(.badResponse))
            }

            let path = Bundle.main.url(forResource: self.pathType.rawValue, withExtension: "json")!
            let data = try! Data(contentsOf: path, options: .mappedIfSafe)
            let results = try! JSONDecoder().decode(T.self, from: data)

            return completion(.success(results))
        }
    }
}
