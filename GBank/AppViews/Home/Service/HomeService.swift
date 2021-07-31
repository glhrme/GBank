//
//  HomeService.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 30/07/21.
//

import Foundation
import Alamofire

class HomeService {
    let endpoint = "http://localhost:3001/v1"
    
    func listTransfers(handler: @escaping (_ result: Result<[Transfer], Error>) -> Void) {
        AF.request("\(endpoint)/transfers", method: .get).responseData { (response) in
            
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    handler(self.parseTransfers(data: data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    func getProfile(handler: @escaping (_ result: Result<[Account], Error>) -> Void) {
        AF.request("\(endpoint)/accounts", method: .get).responseData { (response) in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    handler(self.parseAccount(data: data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    private func parseAccount(data: Data) -> Result<[Account], Error> {
        let decoder = JSONDecoder()
        do {
            let account = try decoder.decode([Account].self, from: data)
            return .success(account)
        } catch {
            return .failure(error)
        }
    }
    
    private func parseTransfers(data: Data) -> Result<[Transfer], Error> {
        let decoder = JSONDecoder()
        do {
            let transfers = try decoder.decode([Transfer].self, from: data)
            return .success(transfers)
        } catch {
            return .failure(error)
        }
    }
    
}
