//
//  StoreCell.swift
//  shopper
//
//  Created by Owner on 10/21/20.
//

import UIKit

class StoreCell: UITableViewCell {
    
    var store: Store!
    @IBOutlet var nameLabel : UITextField!
    
    @IBAction func storeNameChanged(_ sender: UITextField) {
        
        store.name = sender.text ?? ""
    }
    
}
