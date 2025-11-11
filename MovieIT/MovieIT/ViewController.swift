//
//  ViewController.swift
//  MovieIT
//
//  Created by Caio Mandarino on 10/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    let facade = ManagerFacade()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Task{
//            await facade.flowAddMovie(name: "Longas trancas do vovo careca")
            await facade.flowListMovies()
        }
            
    }
}



