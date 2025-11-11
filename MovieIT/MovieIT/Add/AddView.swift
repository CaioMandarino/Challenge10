//
//  AddView.swift
//  MovieIT
//
//  Created by Manoel Pedro Prado Sa Teles on 11/11/25.
//

import UIKit


class AddView: UIView {
    
    private var button: UIButton
    
    override init(frame: CGRect) {
        self.button = UIButton(type: .system)
        super.invalidateIntrinsicContentSize()=
    }
    
}

extension AddView: AddViewDelegate {
    func backToHome() {
        //teste
    }
}
