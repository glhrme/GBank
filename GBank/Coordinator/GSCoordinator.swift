//
//  GSCoordinator.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class GSCoordinator {
    
    var navigation: UINavigationController?
    
    var loginViewController: LoginViewController?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getLogin())
        self.navigation = navigation
        return self.navigation ?? navigation
    }
    
    
    func getLogin() -> UIViewController {
        let vc = LoginViewController()
        self.loginViewController = vc
        return vc
    }
}
