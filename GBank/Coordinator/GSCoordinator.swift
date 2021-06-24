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
    
    var registerViewController: RegisterViewController?
    var registerViewModel: RegisterViewModel?
    
    var welcomeViewControler: WelcomeViewController?
    var welcomeViewModel: WelcomeViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getRoot())
        self.navigation = navigation
        return self.navigation ?? navigation
    }
    
    
    func getRoot() -> UIViewController {
        let vc = WelcomeViewController()
        let vm = WelcomeViewModel()
        vm.delegate = self
        self.welcomeViewModel = vm
        vc.viewModel = self.welcomeViewModel ?? vm
        self.welcomeViewControler = vc
        return self.welcomeViewControler ?? vc
    }
}

extension GSCoordinator: WelcomeViewModelDelegate {
    func goLogin() {
        let vc = LoginViewController()
        self.loginViewController = vc
        self.navigation?.pushViewController(self.loginViewController ?? vc, animated: true)
    }
    
    func goRegister() {
        let vc = RegisterViewController()
        let vm = RegisterViewModel()
        vm.delegate = self
        self.registerViewModel = vm
        vc.viewModel = self.registerViewModel ?? vm
        self.registerViewController = vc
        self.navigation?.pushViewController(self.registerViewController ?? vc, animated: true)
    }
}

extension GSCoordinator: RegisterViewModelDelegate {
    func goLoginPage() {
        self.goLogin()
    }
    
    
}
