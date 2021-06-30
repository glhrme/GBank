//
//  LoginViewController.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel?
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
    }

    @IBAction func entrarPressed(_ sender: UIButton) {
        if let cpf = cpfTextField.text {
            self.viewModel?.makeLogin(cpf)
        }
    }

}

extension LoginViewController: LoginDelegate {
    func didLoginSuccess(_ account: Account) {
        self.viewModel?.gotoHome(account)
    }
    
    func didLoginError(_ error: String) {
        let alert = UIAlertController(title: "Erro ao Logar", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
