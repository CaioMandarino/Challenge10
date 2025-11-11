//
//  AddPresenter.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

// Ir no facade e chamar minha funcao de verificar os filnes

import Foundation

class AddPresenter {
    
    private weak var addView: AddViewDelegate?
//  private var facadeService
//  private(set) var filme: FilmeModel
    
    init(addView: AddViewDelegate? = nil) {
        self.addView = addView
    }
    
    func newText(_ title: String) -> Texto {
        return Texto(text: title)
    }
    
    func save(_ title: String) throws  {
        
        addView?.backToHome()
        
    }
    
    
}
