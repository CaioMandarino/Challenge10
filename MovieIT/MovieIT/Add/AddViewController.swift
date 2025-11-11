//
//  AddViewController.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import UIKit

class AddViewController: UIViewController {
    
    private var addView = AddView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    private func setupAddView(){
        let presenter = AddPresenter(addView: addView)
        // addView.delegate = self
        // addView.presenter = presenter
        self.view = addView
    }
    
    private func backHome(){
        navigationController?.popViewController(animated: true)
    }
}
