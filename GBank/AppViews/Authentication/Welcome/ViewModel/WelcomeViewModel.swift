//
//  WelcomeViewModel.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation

protocol WelcomeViewModelDelegate: AnyObject {
    func goLogin()
    func goRegister()
}

class WelcomeViewModel {
    weak var delegate: WelcomeViewModelDelegate?
    
    func gotoLogin() {
        self.delegate?.goLogin()
    }
    
    func gotoRegister() {
        self.delegate?.goRegister()
    }
}
