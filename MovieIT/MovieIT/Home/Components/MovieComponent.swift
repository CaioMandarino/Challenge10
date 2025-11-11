//
//  MovieComponent.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

class MovieComponent: UIView {
    
    let imagemView = UIImageView()
    let nomeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        imagemView.clipsToBounds = true
        
        nomeLabel.translatesAutoresizingMaskIntoConstraints = false
        nomeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        addSubview(imagemView)
        addSubview(nomeLabel)
        
        NSLayoutConstraint.activate([
            imagemView.widthAnchor.constraint(equalToConstant: 48),
            imagemView.heightAnchor.constraint(equalToConstant: 48),
            
            imagemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            imagemView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            nomeLabel.leadingAnchor.constraint(equalTo: imagemView.trailingAnchor, constant: 16),
            nomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            nomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}
