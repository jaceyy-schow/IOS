//
//  Store.swift
//  shopper
//
//  Created by Owner on 10/18/20.
//

import UIKit

class Store: Equatable, Codable{
    var name: String
    //var itemStore: ItemStore!
    var allItems = [Item]()
    
    init (name: String){
        self.name = name
    }
    
    convenience init ( random: Bool = false){
        if random {
            let stores = ["Costco", "Walmart", "PRPaper", "Dillanos", "Nicholas"]
            
            let randomStore = stores.randomElement()!
            
            self.init(name: randomStore)
        } else {
            self.init(name: "")
        }
    }
    
    static func == (lhs: Store, rhs: Store) -> Bool {
        return lhs.name == rhs.name
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: false)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item){
        if let index = allItems.firstIndex(of: item){
            allItems.remove(at: index)
        }
    }
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        
        allItems.insert(movedItem, at: toIndex)
    }
}
