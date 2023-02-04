//
//  Endpoint.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

struct Endpoint {
    private let baseUrl = "https://api.imgur.com/3/"
  //  private let baseImageUrl = "https://i.imgur.com/"
    private let gallerySearch = "gallery/search/"
    private let query = "?q=cats"

    var apiKey: String {
      guard let filePath = Bundle.main.path(forResource: "ID", ofType: "plist") else { return "" }
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let value = plist?.object(forKey: "API_KEY") as? String else { return ""}
      return value
    }

    func catImagesEndpoint(page: Int = 0) -> String {
        return "\(baseUrl)\(gallerySearch)\(query)&page=\(page)"
    }
}
