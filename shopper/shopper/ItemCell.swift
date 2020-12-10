//
//  ItemCell.swift
//  shopper
//
//  Created by Owner on 10/19/20.
//

import UIKit

class ItemCell: UITableViewCell {
    var item: Item!
    
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var quantityNeedLabel: UITextField!
    @IBOutlet var quantityHaveLabel: UITextField!
    
    @IBAction func needLabelChange(_ sender: UITextField) {
        
        item.quantityNeed = Int(sender.text ?? "0") ?? 0
    
    }
    
    @IBAction func haveLabelChange(_ sender: UITextField) {
        
        item.quantityHave = Int(sender.text ?? "0") ?? 0
    }
    
    @IBAction func nameLabelChanged(_ sender: UITextField) {
        
        item.name = sender.text ?? ""
    }
    
}
