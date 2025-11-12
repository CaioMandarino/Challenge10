//
//  ManagerFacade.swift
//  MovieIT
//
//  Created by Filipi Romão on 10/11/25.
//

import CoreData
import Foundation
import UIKit

struct MovieForShow: Identifiable {
    var id: UUID = UUID()
    let name: String
    let gender: String
    let movieDescription: String
    let releaseData: Date
    let image: UIImage
}


class ManagerFacade {
    private let dbManager: DatabaseManager
    private let networkAdapter: TMDBServiceProtocol

    init(dbManager: DatabaseManager = DatabaseManager(), networkAdapter: some TMDBServiceProtocol) {
        self.dbManager = dbManager
        self.networkAdapter = networkAdapter
    }

    var resultByName: [Movie] = []
    var listMovies: [Movie] = []

    func flowAddMovie(name: String) async {

        let predicateString = "name == '\(name)'"
        let predicate = NSPredicate(format: predicateString)

        do {
            resultByName = try dbManager.getElements(filter: predicate)
            print("Filmes encontrados:", resultByName)
            return
        } catch {
            print("Erro ao buscar filmes: \(error)")
        }

        if resultByName.count > 0 {
            print("O filme já existe na base de dados")
            return
        }

        guard let response = try? await networkAdapter.fetchMovie(), let firstElement = response.results.first else {
            print("Problema ao buscar na API")
            return
        }

        let movie: Movie = await convertNetworkResponseToMovie(response: firstElement)
        
        print(movie)

        do {
            try dbManager.add(movie)
            print("Filme adicionado")
            listMovies = try dbManager.getElements()
        } catch {
            print("Error adding movie: \(error)")
        }
    }

    func flowListMovies() async -> [MovieForShow] {
        do {
            let movies: [Movie] = try dbManager.getElements()
            guard !movies.isEmpty else { return [] }

            var moviesForShow: [MovieForShow] = [] // inicializa array vazio

            for movie in movies {
                let movieForShow = await mapToMovieForShow(movie)
                moviesForShow.append(movieForShow)
            }
            
            print(moviesForShow)
            
            return moviesForShow
        } catch {
            print("Error list movie: \(error)")
            return []
        }
    }


}

extension ManagerFacade {

    private func convertNetworkResponseToMovie(response: Results) async -> Movie {
        let context = dbManager.context
        let convertedMovie = Movie(context: context)

        convertedMovie.name = response.title
        convertedMovie.gender = ""
        convertedMovie.movieDescription = response.overview

        let fullURL = "https://image.tmdb.org/t/p/w500/\(response.postPath)"

        if let imageData = await downloadImageData(url: fullURL) {
            convertedMovie.image = imageData
        }

        return convertedMovie
    }

    private func downloadImageData(url: String) async -> Data? {
        guard let url = URL(string: url) else { return nil }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print("Erro ao baixar imagem: \(error.localizedDescription)")
            return nil
        }
    }

    private func mapToMovieForShow(_ entity: Movie) async -> MovieForShow {
        
        let imageData = entity.image ?? Data()
        
        return await MovieForShow(
            name: entity.name ?? "",
            gender: entity.gender ?? "",
            movieDescription: entity.movieDescription ?? "",
            releaseData: entity.realeseDate ?? Date(),
            image: loadUiImage(data: imageData)
        )
    }

    
    private func loadUiImage(data: Data) async -> UIImage {
        let image = UIImage(data: data)
        return image ?? UIImage() // placeholder
    }

}
