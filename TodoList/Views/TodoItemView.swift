//
//  TodoItemView.swift
//  Counter
//
//  Created by Fababy on 29/08/2024.
//

import SwiftUI

struct TodoItemView: View {
    
    var item: TodoItem
    let onToggle: () -> Void
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title.isEmpty ? "No Title" : item.title).foregroundColor(
                    item.isChecked ? .gray : .black).bold()
                Text(item.type.rawValue).padding(4.5).background(item.type.backgroundColor()).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).bold()
                Text("Created at : \(item.formattedDate(date: item.createAt))").font(.subheadline)
                if(item.updateAt != nil) {
                    Text("Update at : \(item.formattedDate(date: item.createAt))").font(.subheadline)
                }
            }
            Spacer()
            Image(systemName: item.isChecked ? "checkmark.circle" : "circle").onTapGesture {
                onToggle()
            }
            
        }
    }
}

#Preview {
    var isChecked = false
    return TodoItemView(item: TodoItem(title: "String", isChecked: isChecked, type: .health, updateAt: Date.now), onToggle: {
        isChecked.toggle()
    })
}
