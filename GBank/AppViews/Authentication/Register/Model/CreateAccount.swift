//
//  CreateAccount.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation

struct CreateAccount: Codable {
    let name: String
    let cpf: String
    let balance: Double
}
