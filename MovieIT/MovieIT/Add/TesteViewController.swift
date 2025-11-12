//
//  TesteViewController.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 12/11/25.
//

import UIKit

class TesteViewController: UIViewController {
    
    private var home = TesteHomeView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground

        // Quando o botão for tocado na HomeView, apresentamos o modal
        home.onOpenModal = { [weak self] in
            self?.presentModal()
        }
    }
    
    private func presentModal() {
        // Substitua este VC pelo seu modal real já pronto
        // Exemplo:
        let modal = AddViewController()
        modal.modalPresentationStyle = .pageSheet
        present(modal, animated: true)

    }
    
//    private func setupAddView(){
//        let presenter = AddPresenter(addView: addView)
//        // addView.delegate = self
//        // addView.presenter = presenter
//        self.view = addView
//    }
    
    private func backHome(){
        navigationController?.popViewController(animated: true)
    }
}
