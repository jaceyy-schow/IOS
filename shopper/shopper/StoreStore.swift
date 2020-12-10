//
//  StoreStore.swift
//  shopper
//
//  Created by Owner on 10/18/20.
//

import UIKit

class StoreStore {
    var allStores = [Store]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("stores.plist")
    }()
    
    init(){
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([Store].self, from: data)
            allStores = items
        } catch {
            print("Error reading in saved stores: \(error)")
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    @discardableResult func createStore() -> Store {
        let newStore = Store(random: false)
        
        allStores.append(newStore)
        
        return newStore
    }
    
    func removeStore(_ store: Store){
        if let index = allStores.firstIndex(of: store) {
            allStores.remove(at: index)
        }
    }
    
    func moveStore(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        let movedStore = allStores[fromIndex]
        
        allStores.remove(at: fromIndex)
        
        allStores.insert(movedStore, at: toIndex)
        
        print( "Stores: \(allStores)")
    }
    
    @objc func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allStores)
            try data.write(to: itemArchiveURL, options: [.atomic])
            return true
        } catch let encodingError {
            print ("Error encoding allStores: \(encodingError)")
            return false
        }
    }

}
