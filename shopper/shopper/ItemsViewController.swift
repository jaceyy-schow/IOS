//
//  ItemsViewController.swift
//  shopper
//
//  Created by Owner on 10/18/20.
//

import UIKit

class ItemsViewController: UITableViewController, UITextFieldDelegate {
    
    var store: Store! {
        didSet {
            navigationItem.title = store.name
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return store.allItems.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = store.allItems[indexPath.row]
        cell.item = item
        cell.nameLabel.text = item.name
        cell.quantityNeedLabel.text = "\(item.quantityNeed)"
        cell.quantityHaveLabel.text = "\(item.quantityHave)"
    
        
        return cell
    }
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            let item = store.allItems[indexPath.row]
            store.removeItem(item)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath){
        store.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem){
        let newItem = store.createItem()
        
        if let index = store.allItems.firstIndex(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton){
        if isEditing{
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }


}
