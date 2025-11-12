//
//  OlaMundo.swift
//  Challenge10
//
//  Created by Pedro Santos on 10/11/25.
//

import UIKit

class OlaMundo: UIViewController {

    private let helloLabel: UILabel = {
        let label = UILabel()
        
        
        label.text = "Olá mundo"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        self.view.addSubview(helloLabel)

        NSLayoutConstraint.activate([
                    
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
