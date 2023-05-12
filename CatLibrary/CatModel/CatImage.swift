//
//  CatImage.swift
//  CatLibrary
//
//  Created by Tran Hieu on 12/05/2023.
//

import Foundation

/*
 "image": {
    "height": 1445,
    "id": "0XYvRd7oD",
    "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
    "width": 1204
 */

struct CatImage: Codable {
    let height: Int?
    let id: String?
    let url: String?
    let width: Int?
}
