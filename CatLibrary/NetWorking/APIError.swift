//
//  APIError.swift
//  CatLibrary
//
//  Created by Tran Hieu on 13/05/2023.
//

import Foundation


enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse
    case url
    case parsing
    case unknown
    
    
    var userLocalizedDescription: String {
        switch self {
        case .badURL, .parsing, .url, .unknown:
            return "Sorry, there are something wrong"
        case .badResponse:
            return "No Internet"
        }
    }
    
    var description: String {
        switch self {
        case .badURL:
            return "Invalid URL"
        case .badResponse:
            return "No Internet"
        case .url:
            return "URL Session Error"
        case .parsing:
            return "Parsing error"
        case .unknown:
            return "Unknown Error"
        }
    }
    
    
}
