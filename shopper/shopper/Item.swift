//
//  Item.swift
//  shopper
//
//  Created by Owner on 10/18/20.
//

import UIKit

class Item: Equatable, Codable{
    var name: String
    var quantityNeed: Int
    var quantityHave: Int
    
    init(name: String, quantityNeed: Int, quantityHave: Int){
        self.name = name
        self.quantityNeed = quantityNeed
        self.quantityHave = quantityHave
    }
    
    convenience init ( random: Bool = false){
        if random {
            let items = ["Milk", "Cucumber", "Green Onion", "Bananas", "Sponges"]
            
            let randomItem = items.randomElement()!
            let randomNum = Int.random(in: 0..<20)
            
            self.init(name: randomItem, quantityNeed: randomNum, quantityHave: 0)
        }else {
            self.init(name: "", quantityNeed: 0 , quantityHave: 0)
        }
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.quantityNeed == rhs.quantityNeed
            && lhs.quantityHave == rhs.quantityHave
    }
}
