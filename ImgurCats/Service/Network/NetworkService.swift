//
//  NetworkService.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

protocol Networking {
    typealias Fetch<T: Decodable> = ((Result<T, NetworkError>) -> Void)
    func fetchService<T: Decodable>(url: String, headers: [String: String], method: HttpMethod, completion: @escaping Fetch<T>)
}

struct NetworkService: Networking {
    func fetchService<T>(url: String, headers: [String: String], method: HttpMethod, completion: @escaping Fetch<T>) where T : Decodable {
        guard let url = URL(string: url) else {
            return completion(.failure(.invalidURL(url)))
        }

        let headers = headers
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {
                    return completion(.failure(.serverError))
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                   return completion(.failure(.badResponse))
                }

                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}

