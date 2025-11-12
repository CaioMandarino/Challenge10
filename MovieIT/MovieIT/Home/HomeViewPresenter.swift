//
//  HomeViewPresenter.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import Foundation
import UIKit // Necessário para o UIImage dentro de MovieForShow

// 1. Criamos um protocolo. O ViewController vai implementar isso
// para ser "avisado" quando os filmes chegarem.
protocol HomeViewPresenterDelegate: AnyObject {
    func didLoadMovies(_ movies: [MovieForShow])
    func didFail(with error: Error)
}

class HomeViewPresenter {

    private let facade: ManagerFacade
    
    weak var delegate: HomeViewPresenterDelegate?
    
    init(facade: ManagerFacade = ManagerFacade()) {
        self.facade = facade
    }
    
    func loadMovies() {

        Task {
            let movies = await facade.flowListMovies()
            
            await MainActor.run {
                delegate?.didLoadMovies(movies)
            }
        }
    }
}
