//
//  HomeViewController.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func didAddNewMovie()
}


class HomeViewController: UIViewController, HomeViewPresenterDelegate, AddViewControllerDelegate {
    
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
        let telaAddMovie = AddViewController()
        
        telaAddMovie.delegate = self
        
        telaAddMovie.modalPresentationStyle = .automatic
        
        self.present(telaAddMovie, animated: true, completion: nil)
    }
    
    func didAddNewMovie() {
        print("HomeView notificada! Recarregando filmes...")
        presenter.loadMovies()
    }
}
