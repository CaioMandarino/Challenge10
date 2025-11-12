//
//  MovieListView.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

class MovieListView: UIView {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupConstraints()
        addExampleMovieComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        scrollView.addSubview(stackView)
        self.addSubview(scrollView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -20),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -40)
        ])
    }
    
    private func addExampleMovieComponents() {
        for i in 1...15 {
            let filme = MovieComponent()
            filme.nomeLabel.text = "Filme de Exemplo Título \(i)"
            filme.imagemView.backgroundColor = .systemGray4
            filme.imagemView.layer.cornerRadius = 8
            
            stackView.addArrangedSubview(filme)
        }
    }
}
