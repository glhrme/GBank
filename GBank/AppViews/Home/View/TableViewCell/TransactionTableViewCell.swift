//
//  TransactionTableViewCell.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 31/07/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var valueTextLabel: UILabel!
    @IBOutlet weak var cpfTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ cpf: String, _ value: Float) {
        self.valueTextLabel.text = "\(value)"
        self.cpfTextLabel.text = cpf
    }
    
}
