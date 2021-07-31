//
//  HomeViewModel.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 30/07/21.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func listTransations(_ transactions: [Transfer]) -> Void
    func updateProfile(_ profile: Account) -> Void
}

protocol HomeViewModelDelegate: AnyObject {
    
}

class HomeViewModel {
    weak var viewDelegate: HomeViewDelegate?
    weak var delegate: HomeViewModelDelegate?
    let service = HomeService()
    
    func getTransations(_ cpf: String) {
        self.service.listTransfers { (response) in
            switch response {
            case .success(let transfers):
                self.viewDelegate?.listTransations(self.filterTransactions(cpf, transfers))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getProfile(_ id: String) {
        self.service.getProfile { (response) in
            switch response {
            case .success(let accounts):
                self.viewDelegate?.updateProfile(self.filterAccount(id, accounts))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func filterTransactions(_ cpf: String, _ transactions: [Transfer]) -> [Transfer] {
        let filtered = transactions.filter { transaction in
            return transaction.account_origin_id == cpf
        }
        return filtered
    }
    
    private func filterAccount(_ id: String, _ accounts: [Account]) -> Account {
        let account = accounts.filter { (account) -> Bool in
            return account.id == id
        }
        return account[0]
    }
}
