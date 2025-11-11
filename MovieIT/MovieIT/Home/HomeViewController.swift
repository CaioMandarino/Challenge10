//
//  HomeViewController.swift
//  MovieIT
//
//  Created by Pedro Santos on 11/11/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView?


    override func loadView() {
        let view = HomeView(frame: UIScreen.main.bounds)
        self.homeView = view
        self.view = view
    }


    override func viewDidLoad() {
        super.viewDidLoad()


        homeView?.onButtonClick = { [weak self] in
            print("Controller foi")
            self?.apresentarOlaMundo()
        }
    }
    

    private func apresentarOlaMundo() {
        let telaOlaMundo = OlaMundo()
        telaOlaMundo.modalPresentationStyle = .fullScreen
        
        self.present(telaOlaMundo, animated: true, completion: nil)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
