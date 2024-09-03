//
//  TodoListView.swift
//  Counter
//
//  Created by Fababy on 29/08/2024.
//

import SwiftUI

struct TodoListView: View {
    
    @State var todoItems: [TodoItem] = [
        TodoItem(title: "Grocery shopping", isChecked: true, type: .health),
        TodoItem(title: "Finish report for client A", isChecked: false, type: .learning),
        TodoItem(title: "Learn a new coding language", isChecked: true, type: .health),
        TodoItem(title: " Take out the trash", isChecked: false, type: .other),
    ]
    
    func removeItem(itemId: Int) {
        print("nothing")
    }
    
    var body: some View {
        NavigationStack {
            List {
                if !todoItems.isEmpty {
                    ForEach($todoItems, id: \.id) { $item in
                        NavigationLink {
                            TodoDetailView(title: $item.title, isChecked: $item.isChecked, type: $item.type)
                        } label: {
                            TodoItemView(item: item) {
                                if let index = todoItems.firstIndex(where: { $0.id == item.id}) {
                                    todoItems[index].isChecked.toggle()
                                }
                            }.swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) {
                                Button(role: .destructive) {
                                    if let index = todoItems.firstIndex(where: {$0.id == item.id}){
                                        todoItems.remove(at:index)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                        }
                        
                    }
                } else {
                    Text("No tasks to display. 🗒️")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            .navigationTitle("🌟 To-Do List !")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Text("Total: \(todoItems.count)")
                    
                    Button {
                        print("more")
                    } label : {
                        Label("More", systemImage: "line.3.horizontal.decrease.circle")
                    }
                    Button(action: {
                        todoItems.insert(TodoItem(title: "New Item", isChecked: false, type: .other), at: 0)
                        
                    }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TodoListView()
}
