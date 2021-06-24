//
//  RegisterViewModel.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func goLoginPage()
    func goHomePage(_ account: Account)
}

protocol RegisterDelegate: AnyObject {
    func didAccountCreated(_ account: Account)
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    
    func createAccount(_ name: String, _ cpf: String) {
        RegisterService().createAccount(name: name, cpf: cpf) { (result) in
            switch result {
            case .success(let account):
                print(account)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func gotoLoginPage() {
        self.delegate?.goLoginPage()
    }
}
