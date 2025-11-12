//
//  NetworkingServiceAdapter.swift
//  MovieIT
//
//  Created by Andreas Gomes Marchi on 12/11/25.
//

import Foundation

// async / await

final class NetworkingServiceAdapter: TMDBServiceProtocol { // protocol interface
    let networkService: NetworkingService
    
    init(networkService: NetworkingService) {
        self.networkService = networkService
    }
    
    func fetchMovie(completionHandeler: @escaping (Result<MovieResponse, Error>) -> Void) { // antiga, closure
        
        networkService.fetch(endpoint: "movie/popular") { result in
        
            switch result {
            case .success(let data):
                // decoded data
                guard let decodedData = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                    completionHandeler(.failure(URLError(.dataNotAllowed)))
                    return
                }
                
                completionHandeler(.success(decodedData))
                
                
            case .failure (let error):
                completionHandeler(.failure(error))
            }
        }
    
    }
    
    
    func fetchMovie() async throws -> MovieResponse { // moderno, async e await
        let data = try await networkService.fetch(endpoint: "movie/popular")
        
        guard let decodedData = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
            throw URLError(.dataNotAllowed)
        }
        
        return decodedData
    }
}
