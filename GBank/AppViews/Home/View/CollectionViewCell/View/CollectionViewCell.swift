
//
//  CollectionViewCell.swift
//  GBank
//
//  Created by Guilherme de Assis dos Santos on 30/06/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.button.layer.borderWidth = 1
        self.button.layer.borderColor = #colorLiteral(red: 0.2252025902, green: 0.6793150306, blue: 0.5445357561, alpha: 1)
    }

}
