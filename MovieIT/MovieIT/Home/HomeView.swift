//
//  HomeView.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

class HomeView: UIView {
    
    var onButtonClick: (() -> Void)?
    
    
    private let movieListView: MovieListView = {
        let list = MovieListView()
        list.translatesAutoresizingMaskIntoConstraints = false
        return list
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        self.addSubview(movieListView)
        self.addSubview(addButton)
        
        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            movieListView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            movieListView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            movieListView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            movieListView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    @objc func didTapButton(){
        print("Botão na HomeView foi tocado, avisando o controller...")
        onButtonClick?()
    }
    
    func updateMovieList(with movies: [MovieForShow]) {
        movieListView.displayMovies(movies)
    }
}
