//
//  AddViewController.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import UIKit


class AddViewController: UIViewController {
    
    private var addView = AddView()
    
    weak var delegate: AddViewControllerDelegate?
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupAddView()
        
    }
    
    private func setupAddView(){
        let presenter = AddPresenter(addView: addView)
        addView.delegate = self
        addView.presenter = presenter
        self.view = addView
    }
    
    private func backHome(){
        delegate?.didAddNewMovie()
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}

extension AddViewController: AddViewDelegate {
    func backToHome(){ backHome()}
}
