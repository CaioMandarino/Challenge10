//
//  NetworkServiceProtocol.swift
//  MovieIT
//
//  Created by Andreas Gomes Marchi on 11/11/25.
//

import Foundation

protocol TMDBServiceProtocol{
    func fetchMovie(completionHandeler: @escaping (Result<MovieResponse, Error>) -> Void) 
}
