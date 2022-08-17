//
//  ListRowView.swift
//  SimpleDo
//
//  Created by yury mid on 07.08.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "test", isCompleted: false)
    static var item2 = ItemModel(title: "test2", isCompleted: true)
    
    static var previews: some View {
//        ListRowView(item1)
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
