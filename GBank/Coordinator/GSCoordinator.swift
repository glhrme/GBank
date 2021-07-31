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
    var loginViewModel: LoginViewModel?
    
    var registerViewController: RegisterViewController?
    var registerViewModel: RegisterViewModel?
    
    var welcomeViewControler: WelcomeViewController?
    var welcomeViewModel: WelcomeViewModel?
    
    var homeViewController: HomeViewController?
    var homeViewModel: HomeViewModel?
    
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
        vc.viewModel = vm
        self.welcomeViewControler = vc
        return self.welcomeViewControler ?? vc
    }
    
//    func qualquerCanto() -> UITabBarController {
//        let nav = UINavigationController(rootViewController: self.getRoot())
//        let tabBar = UITabBarController()
//        tabBar.viewControllers = [nav]
//        return tabBar
//    }
    
}

extension GSCoordinator: WelcomeViewModelDelegate {
    func goLogin() {
        let vc = LoginViewController()
        let vm = LoginViewModel()
        vm.delegate = self
        self.loginViewModel = vm
        vc.viewModel = vm
        self.loginViewController = vc
        self.navigation?.pushViewController(vc, animated: true)
    }
    
    func goRegister() {
        let vc = RegisterViewController()
        let vm = RegisterViewModel()
        vm.delegate = self
        self.registerViewModel = vm
        vc.viewModel = vm
        self.registerViewController = vc
        self.navigation?.pushViewController(vc, animated: true)
    }
}

extension GSCoordinator: RegisterViewModelDelegate {
    func goLoginPage() {
        self.goLogin()
    }
}

extension GSCoordinator: LoginViewModelDelegate {
    func goHome(_ account: Account) {
        let vc = HomeViewController()
        let vm = HomeViewModel()
        vm.delegate = self
        vc.viewModel = vm
        vc.account = account
        self.homeViewModel = vm
        self.homeViewController = vc
        self.navigation?.pushViewController(vc, animated: true)
    }
}

extension GSCoordinator: HomeViewModelDelegate {
    
}
