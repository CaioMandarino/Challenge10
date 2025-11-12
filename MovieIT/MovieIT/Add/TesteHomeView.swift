//
//  TesteHomeView.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import UIKit

class TesteHomeView: UIView {
    // Exponha um callback simples para avisar o ViewController
    var onOpenModal: (() -> Void)?

    // Botão central
    private let openModalButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Abrir modal", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .systemBackground
        setupView()
    }

    private func setupView() {
        addSubview(openModalButton)
        NSLayoutConstraint.activate([
            openModalButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openModalButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            openModalButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        openModalButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc private func handleButtonTap() {
        onOpenModal?()
    }
}
