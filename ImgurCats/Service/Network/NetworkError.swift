//
//  NetworkError.swift
//  ImgurCats
//
//  Created by Giovane Barreira on 04/02/23.
//

import Foundation

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidURL(String)
    case serverError
    case badResponse
    case decodingError
   // case invalidPage

    var errorDescription: String? {
        switch self {
        case .invalidURL(let url): return "\(url) is unreachable"
        case .serverError: return "A server error ocurred"
        case .badResponse: return "Error, bad response"
        case .decodingError: return "Error ocurred when decoding Json response"
     //   case .invalidPage: return "Invalid requested page"
        }
    }
}

