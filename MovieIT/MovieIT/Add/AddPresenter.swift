//
//  AddPresenter.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import Foundation

class AddPresenter {
    
    private weak var delegate: AddPresenterDelegate?
    private var facadeService = ManagerFacade()

    init(delegate: AddPresenterDelegate? = nil) {
        self.delegate = delegate
    }
    
    
    @MainActor func save(_ title: String) async  {
        await facadeService.flowAddMovie(name: title)
        
        delegate?.didFinishSaving()
    }
    
}
