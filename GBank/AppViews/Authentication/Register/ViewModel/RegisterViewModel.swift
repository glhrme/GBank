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
    func didErrorAccountCreated(_ error: Error)
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    weak var viewDelegate: RegisterDelegate?
    
    func createAccount(_ name: String, _ cpf: String) {
        RegisterService().createAccount(name: name, cpf: cpf) { (result) in
            switch result {
            case .success(let account):
                self.viewDelegate?.didAccountCreated(account)
            case .failure(let error):
                self.viewDelegate?.didErrorAccountCreated(error)
            }
        }
    }
    
    func gotoLoginPage() {
        self.delegate?.goLoginPage()
    }
    
    func gotoHomePage(_ account: Account) {
        self.delegate?.goHomePage(account)
    }
}
