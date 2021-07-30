//
//  Transfer.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 30/07/21.
//

import Foundation

struct Transfer: Codable {
    let id: String
    let account_origin_id: String
    let account_destination_id: String
    let amount: Float
    let created_at: String
}
