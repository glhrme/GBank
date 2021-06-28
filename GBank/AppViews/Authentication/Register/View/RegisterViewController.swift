//
//  RegisterViewController.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var viewModel: RegisterViewModel?
    
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.viewDelegate = self
    }

    @IBAction func criarContaPressed(_ sender: UIButton) {
        if let name = self.nomeTextField.text, let cpf = self.cpfTextField.text {
            self.viewModel?.createAccount(name, cpf)
        }
    }
    
    @IBAction func logarPressed(_ sender: UIButton) {
        self.viewModel?.gotoLoginPage()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisterViewController: RegisterDelegate {
    func didAccountCreated(_ account: Account) {
        self.viewModel?.gotoHomePage(account)
    }
    
    func didErrorAccountCreated(_ error: Error) {
        let alert = UIAlertController(title: "Erro ao criar a conta", message: error.localizedDescription, preferredStyle: .alert)
        let actionDefault = UIAlertAction(title: "Continuar", style: .default, handler: nil)
        alert.addAction(actionDefault)
        self.present(alert, animated: true, completion: nil)
    }

}
