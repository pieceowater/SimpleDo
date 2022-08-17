//
//  ListViewModel.swift
//  SimpleDo
//
//  Created by yury mid on 08.08.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "Welcome!", isCompleted: true),
//            ItemModel(title: "You can reorder items in Edit-mode", isCompleted: false),
//            ItemModel(title: "Also you can delete items by swiping", isCompleted: false),
//            ItemModel(title: "And you can check completed items!", isCompleted: true)
//         ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let endcodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(endcodedData, forKey: itemsKey)
        }
    }
    
}
