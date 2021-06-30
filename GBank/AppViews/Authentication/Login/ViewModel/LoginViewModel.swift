//
//  LoginViewModel.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 29/06/21.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func goHome(_ account: Account)
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    func makeLogin(_ cpf: String) {
        print(cpf)
    }
}
