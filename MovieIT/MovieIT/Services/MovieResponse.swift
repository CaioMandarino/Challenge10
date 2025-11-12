//
//  MovieResponse.swift
//  MovieIT
//
//  Created by Caio Mandarino on 12/11/25.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    
    let title: String
    let postPath: String
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case postPath = "poster_path"
        case releaseDate = "release_date"
    }
}


