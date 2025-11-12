//
//  AddPresenter.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import Foundation

class AddPresenter {
    
    private weak var addView: AddViewDelegate?
    private weak var delegate: AddPresenterDelegate?
    
    private var facadeService = ManagerFacade(networkAdapter: NetworkingServiceAdapter(networkService: .init()))
    
    init(addView: AddViewDelegate? = nil, delegate: AddPresenterDelegate? = nil) {
        self.addView = addView
        self.delegate = delegate
    }
    
    
    @MainActor func save(_ title: String) async  {
        await facadeService.flowAddMovie(name: title)
        
        delegate?.didFinishSaving()
    }
    
}
