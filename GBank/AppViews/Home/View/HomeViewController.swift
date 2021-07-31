//
//  HomeViewController.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 23/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    var account: Account?
    weak var viewModel: HomeViewModel?
    let identifierCollectionView = "identifierFilhao"
    let identifierTableViewCell = "identifierTableViewCell"
    var transactions: [Transfer] = []
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupTableView()
        self.viewModel?.viewDelegate = self
        if let cpf = self.account?.id {
            self.viewModel?.getTransations(cpf)
            self.viewModel?.getProfile(cpf)
        }
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifierTableViewCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.identifierCollectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.identifierCollectionView, for: indexPath) as! CollectionViewCell
        return cell
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.identifierTableViewCell, for: indexPath) as! TransactionTableViewCell
        cell.setup(transactions[indexPath.row].account_destination_id, transactions[indexPath.row].amount)
        return cell
    }
    
    
}

extension HomeViewController: HomeViewDelegate {
    func updateProfile(_ profile: Account) {
        self.welcomeLabel.text = "Bem vindo, \(profile.name)"
        self.saldoLabel.text = "\(profile.balance)"
    }
    
    func listTransations(_ transactions: [Transfer]) {
        self.transactions = transactions
        self.tableView.reloadData()
    }
    
}
