//
//  AddView.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import UIKit


class AddView: UIView {
    
    var presenter: AddPresenter!
    weak var delegate: AddViewDelegate?
    
    private let textWriter: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o filme"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.accessibilityLabel = "Fechar"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        button.accessibilityLabel = "Salvar"
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .systemBackground
        setupView()
        setupActions()
    }
    
    private func setupView(){
        addSubview(textWriter)
        addSubview(backButton)
        addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            
            textWriter.centerXAnchor.constraint(equalTo: centerXAnchor),
            textWriter.centerYAnchor.constraint(equalTo: centerYAnchor),
            textWriter.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 24),
            textWriter.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -24),
            textWriter.widthAnchor.constraint(lessThanOrEqualToConstant: 400),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            saveButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupActions(){
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc func backTapped(){
        delegate?.backToHome()
    }
    
    @objc func saveTapped(){
        guard let text = textWriter.text, !text.isEmpty else { return }
        
        Task { [weak self] in
            guard let presenter = self?.presenter else { return }
            await presenter.save(text)
        }
    }
}

extension AddView: AddViewDelegate {
    func backToHome() {}
}
