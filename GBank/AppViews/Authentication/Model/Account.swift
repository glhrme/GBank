//
//  Account.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation

struct Account: Codable {
    let id: String
    let name: String
    let cpf: String
    let balance: Double
    let created_at: String
}
