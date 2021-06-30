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
    }

    @IBAction func entrarPressed(_ sender: UIButton) {
        if let cpf = cpfTextField.text {
            self.viewModel?.makeLogin(cpf)
        }
    }

}
