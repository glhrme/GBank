//
//  HomeViewController.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    var account: Account?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
