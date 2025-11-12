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
    private var facadeService = ManagerFacade()
    
    init(addView: AddViewDelegate? = nil) {
        self.addView = addView
    }
    
    
    @MainActor func save(_ title: String) async  {
        await facadeService.flowAddMovie(name: title)
        addView?.backToHome()
        
    }
    
    
}
