//
//  WelcomeViewController.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    var viewModel: WelcomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func criarContaPressed(_ sender: UIButton) {
        viewModel?.gotoRegister()
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        viewModel?.gotoLogin()
    }

}
