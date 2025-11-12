//
//  HomeViewController.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

class HomeViewController: UIViewController, HomeViewPresenterDelegate {
    
    private var homeView: HomeView?
    
    private let presenter = HomeViewPresenter()

    override func loadView() {
        let view = HomeView(frame: UIScreen.main.bounds)
        self.homeView = view
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.delegate = self
        
        presenter.loadMovies()

        homeView?.onButtonClick = { [weak self] in
            print("Controller foi")
            self?.apresentarAddView()
        }
    }
        
    func didLoadMovies(_ movies: [MovieForShow]) {
        homeView?.updateMovieList(with: movies)
        print("Foi, os filmes vao aparecer")
    }
    
    func didFail(with error: Error) {
        print("Falha ao carregar filmes: \(error.localizedDescription)")
    }

    private func apresentarAddView() {
        let telaOlaMundo = AddViewController()
        telaOlaMundo.modalPresentationStyle = .automatic
        
        self.present(telaOlaMundo, animated: true, completion: nil)
    }
}
