//
//  CatObject.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 08/02/23.
//

import UIKit

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
        return cats.tags.first?.displayName ?? "name unavailable"
    }
}
