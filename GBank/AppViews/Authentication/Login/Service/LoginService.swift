//
//  LoginService.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 29/06/21.
//

import Foundation
import Alamofire

class LoginService {
    let endpoint = "http://localhost:3001/v1/accounts"
    
    func login(handler: @escaping (_ result: Result<[Account], Error>) -> Void) {
        AF.request(endpoint, method: .get).responseData { (response) in
            switch response.result {
            case .success(let data):
                handler(self.parseAccounts(data: data))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    private func parseAccounts(data: Data) -> Result<[Account], Error> {
        let decoder = JSONDecoder()
        do {
            let accounts = try decoder.decode([Account].self, from: data)
            return .success(accounts)
        } catch {
            return .failure(error)
        }
    }
}
