//
//  RegisterService.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import Foundation
import Alamofire

class RegisterService {
    let endpoint = "http://localhost:3001/v1/accounts"
    
    func createAccount(name: String, cpf: String, handler: @escaping (_ account: Result<Account, Error>) -> Void) {
        let acc: Dictionary<String, Any> = [
            "name": name,
            "cpf": cpf,
            "balance": 100000
        ]
        AF.request(endpoint, method: .post, parameters: acc, encoding: JSONEncoding.default).responseData { (response) in
            switch response.result {
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            case .success(let account):
                DispatchQueue.main.async {
                    handler(self.parseAccount(data: account))
                }
            }
        }
    }
    
    func parseAccount(data: Data) -> Result<Account, Error> {
        let decoder = JSONDecoder()
        do {
            let account = try decoder.decode(Account.self, from: data)
            return .success(account)
        } catch {
            return .failure(error)
        }
    }
}
