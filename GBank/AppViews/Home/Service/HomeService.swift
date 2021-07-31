//
//  HomeService.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 30/07/21.
//

import Foundation
import Alamofire

class HomeService {
    let endpoint = "http://localhost:3001/v1/transfers"
    
    func listTransfers(handler: @escaping (_ result: Result<[Transfer], Error>) -> Void) {
        AF.request(endpoint, method: .get).responseData { (response) in
            
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
