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

protocol LoginDelegate: AnyObject {
    func didLoginSuccess(_ account: Account)
    func didLoginError(_ error: String)
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    weak var viewDelegate: LoginDelegate?
    
    func makeLogin(_ cpf: String) {
        LoginService().login { (result) in
            switch result {
            case .success(let accounts): do {
                if let account = self.selectCurrentAccount(accounts, cpf) {
                    self.viewDelegate?.didLoginSuccess(account)
                } else {
                    self.viewDelegate?.didLoginError("Conta não encontrada")
                }
            }
            case .failure(let error):
                self.viewDelegate?.didLoginError(error.localizedDescription)
            }
        }
    }
    
    private func selectCurrentAccount(_ accounts: [Account], _ cpf: String) -> Account? {
        let accountsFiltered = accounts.filter { (account) -> Bool in
            if account.cpf == cpf {
                return true
            } else {
                return false
            }
        }
        
        if accountsFiltered.count > 0 {
            return accountsFiltered[0]
        }
        return nil
    }
    
    func gotoHome(_ account: Account) {
        self.delegate?.goHome(account)
    }
}
