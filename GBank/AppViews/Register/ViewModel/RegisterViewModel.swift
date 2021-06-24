//
//  RegisterViewModel.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func goLoginPage()
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    
    func gotoLoginPage() {
        self.delegate?.goLoginPage()
    }
}
