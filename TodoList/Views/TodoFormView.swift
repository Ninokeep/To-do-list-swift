//
//  TodoFormView.swift
//  Counter
//
//  Created by Fababy on 29/08/2024.
//

import SwiftUI

struct TodoFormView: View {
    
    @Binding var title: String
    @Binding var isChecked: Bool
    @Binding var type: TodoType
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $title)
                
            } header: {
                Text("Name")
            }
            
            Section {
                Toggle("finished", isOn: $isChecked)
            } header :{
                Text("Status")
            }
            
            Section {
                Picker("Type", selection: $type) {
                    ForEach(TodoType.allCases, id: \.id) { t in
                        Text(t.rawValue).tag(t)
                    }
                }
            }
            
        }
    }
}

#Preview {
    
    TodoFormView(title: .constant("String"), isChecked: .constant(true), type: .constant(.personal))
}
